/*terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.17"
    }
  }
}*/

locals {
  common_tags_values = zipmap(
    formatlist(
      "%s.%s",
      var.common_tags_values["Namespace"],
      keys(var.common_tags_values),
    ),
    values(var.common_tags_values),
  )

  lb_ssl                   = length(var.listener_ssl_port) > 0 ? true : false
  lb_no_ssl                = [for i in var.listener_port : i if i != "443"]
  listener_ssl_certificate = var.certificate_ca_certificate != "" ? [oci_load_balancer_certificate.certificate.0.ca_certificate] : []
  lb_ssl_certificate       = var.backend_certificate == true ? [oci_load_balancer_certificate.certificate.0.ca_certificate] : []

  path_rules     = oci_load_balancer_path_route_set.path_route_set
  path_ssl_rules = oci_load_balancer_path_route_set.ssl_path_route_set
  rule_sets      = var.rule_set_enable == true ? [oci_load_balancer_rule_set.rule_set.0.name] : null

  no_ssl = [for i in var.listener_port : {
    port          = i
    listener_name = "ls_${i}"
    backend_set   = "bs_${i}"
  } if i != "443"]

  ssl = [for i in var.listener_ssl_port : {
    port          = i
    listener_name = "ls_${i}"
    backend_set   = "bs_${i}"
  }]

  backend_no_ssl_ip_address = flatten([for i in var.backend_port : [
    for x in var.backend_ip_address : [for v in local.backend_set_no_ssl_update_checker : {
      port        = i
      ip_address  = x
      backend_set = v.backend_set
    } if length(regexall("${i}", v.backend_set)) > 0]
  ] if i != "443"])

  backend_ssl_ip_address = flatten([for i in var.backend_ssl_port : [
    for x in var.backend_ip_address : [for v in local.backend_set_ssl_update_checker : {
      port        = i
      ip_address  = x
      backend_set = v.backend_set
    }]
  ]])

  backend_set_no_ssl_update_checker = [for i in var.nosecure_update_checker : {
    port        = i.port
    protocol    = i.protocol
    backend_set = "bs_${i.port}"
  }]

  backend_set_ssl_update_checker = [for i in var.secure_update_checker : {
    port        = i.port
    protocol    = i.protocol
    backend_set = "bs_${i.port}"
  }]

  rule_set_add_http = [for i in var.rule_set_items : {
    action = i.action
    header = i.header
    value  = i.value
  } if i.action == "ADD_HTTP_REQUEST_HEADER" || i.action == "ADD_HTTP_RESPONSE_HEADER"]

  rule_set_extend_http = [for i in var.rule_set_items : {
    action = i.action
    header = i.header
    prefix = i.prefix
    suffix = i.suffix
    value  = i.value
  } if i.action == "EXTEND_HTTP_REQUEST_HEADER_VALUE" || i.action == "EXTEND_HTTP_RESPONSE_HEADER_VALUE"]

  rule_set_remove_http = [for i in var.rule_set_items : {
    action = i.action
    header = i.header
  } if i.action == "REMOVE_HTTP_REQUEST_HEADER_VALUE" || i.action == "REMOVE_HTTP_RESPONSE_HEADER_VALUE"]

  rule_set_control_access = [for i in var.rule_set_items : {
    action          = i.action
    allowed_methods = i.methods
    status_code     = i.status
  } if i.action == "CONTROL_ACCESS_USING_HTTP_METHODS"]


  rule_set_allow_path = [for i in var.rule_set_items : {
    action         = i.action
    attribute_name = "PATH"
    operator       = i.operator
    description    = "${i.operator}"
  } if i.action == "ALLOW" && i.attribute_name == "PATH"]

  rule_set_allow_source_ip = [for i in var.rule_set_items : {
    action          = i.action
    attribute_name  = "SOURCE_IP_ADDRESS"
    attribute_value = i.ip_address
    description     = "${i.ip_address}"
  } if i.action == "ALLOW" && i.attribute_name == "SOURCE_IP_ADDRESS"]

  rule_set_allow_source_vcn_ip = [for i in var.rule_set_items : {
    action          = i.action
    attribute_name  = "SOURCE_VCN_IP_ADDRESS"
    attribute_value = i.ip_address
    description     = "${i.ip_address}"
  } if i.action == "ALLOW" && i.attribute_name == "SOURCE_VCN_IP_ADDRESS"]

  rule_set_allow_source_vcn_id = [for i in var.rule_set_items : {
    action          = i.action
    attribute_name  = "SOURCE_VCN_ID"
    attribute_value = i.vcn_id
    description     = "${i.vcn_id}"
  } if i.action == "ALLOW" && i.attribute_name == "SOURCE_VCN_ID"]


  rule_set_redirect = []

}

resource "oci_load_balancer_load_balancer" "load_balancer" {
  #Required
  compartment_id = var.compartment_id
  display_name   = var.load_balancer_name
  shape          = var.load_balancer_shape
  subnet_ids     = var.load_balancer_subnet_ids

  #Optional
  defined_tags               = local.common_tags_values
  freeform_tags              = var.freeform_tags
  ip_mode                    = var.load_balancer_ip_mode
  is_private                 = var.load_balancer_is_private
  network_security_group_ids = var.load_balancer_network_security_group_ids
}

resource "oci_load_balancer_hostname" "hostname" {
  count = var.load_balancer_hostname != "" ? 1 : 0
  #Required
  hostname         = var.load_balancer_hostname
  load_balancer_id = oci_load_balancer_load_balancer.load_balancer.id
  name             = var.load_balancer_name

  depends_on = [oci_load_balancer_load_balancer.load_balancer]
}

resource "oci_load_balancer_listener" "listener" {
  count = length(local.no_ssl)
  #Required
  default_backend_set_name = lookup(local.no_ssl[count.index], "backend_set")
  load_balancer_id         = oci_load_balancer_load_balancer.load_balancer.id
  name                     = lookup(local.no_ssl[count.index], "listener_name")
  port                     = lookup(local.no_ssl[count.index], "port")
  protocol                 = lookup(local.no_ssl[count.index], "port") == "80" ? "HTTP" : "TCP"

  #Optional
  connection_configuration {
    #Required
    idle_timeout_in_seconds = var.listener_idle_timeout
  }
  hostname_names = lookup(local.no_ssl[count.index], "port") == "80" ? [oci_load_balancer_hostname.hostname.0.name] : null
  #path_route_set_name = local.path_rules != [] && lookup(local.no_ssl[count.index], "port") == "80" ? lookup(local.path_rules[count.index], "name") : null
  #path_route_set_name = null
  rule_set_names = local.rule_sets

  depends_on = [oci_load_balancer_load_balancer.load_balancer]
}

resource "oci_load_balancer_backend_set" "backend_set" {
  count            = length(local.backend_set_no_ssl_update_checker) > 0 ? length(local.backend_set_no_ssl_update_checker) : 0
  load_balancer_id = oci_load_balancer_load_balancer.load_balancer.id
  name             = lookup(local.backend_set_no_ssl_update_checker[count.index], "backend_set")
  policy           = var.backend_set_policy

  #Required
  health_checker {
    #Required
    protocol = lookup(local.backend_set_no_ssl_update_checker[count.index], "protocol")

    #Optional
    interval_ms         = var.backend_set_interval_ms
    port                = lookup(local.backend_set_no_ssl_update_checker[count.index], "port")
    response_body_regex = var.backend_set_body_regex
    retries             = var.backend_set_retries
    return_code         = var.backend_set_return_code
    timeout_in_millis   = var.backend_set_timeout_in_millis
    url_path            = var.backend_set_url_path

  }

  depends_on = [oci_load_balancer_load_balancer.load_balancer]
}


resource "oci_load_balancer_backend" "backend" {
  count = length(local.backend_no_ssl_ip_address)
  #Required
  backendset_name  = lookup(local.backend_no_ssl_ip_address[count.index], "backend_set")
  ip_address       = lookup(local.backend_no_ssl_ip_address[count.index], "ip_address")
  load_balancer_id = oci_load_balancer_load_balancer.load_balancer.id
  port             = lookup(local.backend_no_ssl_ip_address[count.index], "port")

  #Optional
  backup  = var.backend_backup
  drain   = var.backend_drain
  offline = var.backend_offline
  weight  = var.backend_weight

  depends_on = [oci_load_balancer_backend_set.backend_set, oci_load_balancer_load_balancer.load_balancer]
}

resource "oci_load_balancer_backend" "ssl_backend" {
  count = local.lb_ssl == true ? length(local.backend_ssl_ip_address) : 0
  #Required
  backendset_name  = lookup(local.backend_ssl_ip_address[count.index], "backend_set")
  ip_address       = lookup(local.backend_ssl_ip_address[count.index], "ip_address")
  load_balancer_id = oci_load_balancer_load_balancer.load_balancer.id
  port             = lookup(local.backend_ssl_ip_address[count.index], "port")

  #Optional
  backup  = var.backend_backup
  drain   = var.backend_drain
  offline = var.backend_offline
  weight  = var.backend_weight

  depends_on = [oci_load_balancer_backend_set.ssl_backend_set, oci_load_balancer_load_balancer.load_balancer]
}

resource "oci_load_balancer_backend_set" "ssl_backend_set" {
  count            = local.lb_ssl == true ? length(local.backend_set_ssl_update_checker) : 0
  load_balancer_id = oci_load_balancer_load_balancer.load_balancer.id
  name             = lookup(local.backend_set_ssl_update_checker[count.index], "backend_set")
  policy           = var.backend_set_policy

  #Required
  health_checker {
    #Required
    protocol = lookup(local.backend_set_ssl_update_checker[count.index], "protocol")

    #Optional
    interval_ms         = var.backend_set_interval_ms
    port                = lookup(local.backend_set_ssl_update_checker[count.index], "port")
    response_body_regex = var.backend_set_body_regex
    retries             = var.backend_set_retries
    return_code         = var.backend_set_return_code
    timeout_in_millis   = var.backend_set_timeout_in_millis
    url_path            = var.backend_set_url_path
  }


  dynamic "ssl_configuration" {
    for_each = local.lb_ssl_certificate
    content {
      certificate_name        = oci_load_balancer_certificate.certificate.0.certificate_name
      verify_depth            = var.backend_set_ssl_verify_depth
      verify_peer_certificate = var.backend_set_ssl_verify_peer_certificate
    }
  }

  depends_on = [oci_load_balancer_certificate.certificate, oci_load_balancer_load_balancer.load_balancer]
}


resource "oci_load_balancer_listener" "ssl_listener" {
  count = local.lb_ssl == true ? length(local.ssl) : 0
  #Required
  default_backend_set_name = element(oci_load_balancer_backend_set.ssl_backend_set.*.name, count.index)
  load_balancer_id         = oci_load_balancer_load_balancer.load_balancer.id
  name                     = lookup(local.ssl[count.index], "listener_name")
  port                     = lookup(local.ssl[count.index], "port")
  protocol                 = lookup(local.ssl[count.index], "port") == "443" || lookup(local.ssl[count.index], "port") == "80" ? "HTTP" : "TCP"

  #Optional
  connection_configuration {
    #Required
    idle_timeout_in_seconds = var.listener_idle_timeout
  }
  hostname_names = ["${oci_load_balancer_hostname.hostname.0.name}"]

  dynamic "ssl_configuration" {
    for_each = local.listener_ssl_certificate
    content {
      certificate_name        = oci_load_balancer_certificate.certificate.0.certificate_name
      verify_depth            = var.backend_set_ssl_verify_depth
      verify_peer_certificate = var.backend_set_ssl_verify_peer_certificate
    }
  }

  #path_route_set_name = local.path_ssl_rules != [] && lookup(local.ssl[count.index], "port" ) == "443" ? lookup(local.path_ssl_rules[count.index],"name") : null
  #path_route_set_name = null
  rule_set_names = local.rule_sets

  depends_on = [oci_load_balancer_load_balancer.load_balancer, oci_load_balancer_backend_set.ssl_backend_set, oci_load_balancer_hostname.hostname]
}

resource "oci_load_balancer_certificate" "certificate" {
  count = local.lb_ssl == true && var.certificate_ca_certificate != "" ? 1 : 0
  #Required
  certificate_name = var.certificate_name
  load_balancer_id = oci_load_balancer_load_balancer.load_balancer.id

  #Optional
  ca_certificate     = file(var.certificate_ca_certificate)
  passphrase         = var.certificate_passphrase
  private_key        = file(var.certificate_private_key)
  public_certificate = file(var.certificate_public_certificate)

  lifecycle {
    create_before_destroy = true
  }
}

resource "oci_load_balancer_path_route_set" "path_route_set" {
  count = var.path_route_enable == true ? length(local.no_ssl) : 0
  #Required
  load_balancer_id = oci_load_balancer_load_balancer.load_balancer.id
  name             = lookup(local.no_ssl[count.index], "backend_set")

  dynamic "path_routes" {
    for_each = var.path_route_set
    content {
      backend_set_name = lookup(local.no_ssl[count.index], "backend_set")
      path             = path_routes.value.routes
      path_match_type {
        match_type = path_routes.value.type
      }
    }
  }

  depends_on = [oci_load_balancer_backend_set.backend_set]
}

resource "oci_load_balancer_path_route_set" "ssl_path_route_set" {
  count = var.path_route_enable == true && local.lb_ssl == true ? 1 : 0
  #Required
  load_balancer_id = oci_load_balancer_load_balancer.load_balancer.id
  name             = lookup(local.ssl[count.index], "backend_set")

  dynamic "path_routes" {
    for_each = var.path_route_set
    content {
      backend_set_name = lookup(local.ssl[count.index], "backend_set")
      path             = path_routes.value.routes
      path_match_type {
        match_type = path_routes.value.type
      }
    }
  }

  depends_on = [oci_load_balancer_backend_set.ssl_backend_set]
}

resource "oci_load_balancer_rule_set" "rule_set" {
  count = var.rule_set_enable == true ? 1 : 0

  dynamic "items" {
    for_each = local.rule_set_add_http
    content {
      action = items.value.action
      header = items.value.header
      value  = items.value.value
    }
  }

  dynamic "items" {
    for_each = local.rule_set_extend_http
    content {
      action = items.value.action
      header = items.value.header
      prefix = lookup(items.value.prefix, "prefix", "")
      suffix = lookup(items.value.suffix, "suffix", "")
      value  = lookup(items.value.value, "value", "")
    }
  }

  dynamic "items" {
    for_each = local.rule_set_remove_http
    content {
      action = items.value.action
      header = items.value.header
    }
  }

  dynamic "items" {
    for_each = local.rule_set_control_access
    content {
      action          = items.value.action
      allowed_methods = lookup(items.value.allowed_methods, "allowed_methods", "GET")
      status_code     = lookup(items.value.status_code, "status_code", "")
    }
  }

  load_balancer_id = oci_load_balancer_load_balancer.load_balancer.id
  name             = var.rule_set_name == "" ? "SNI" : ""
}
