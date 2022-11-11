terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.17"
    }
  }
}
# ----------------------------------------------------------------------------------------------------------------------
# Locals
# ----------------------------------------------------------------------------------------------------------------------

locals {
  ingress_icmp = [for x in var.ingress_rules : x if upper(x.protocol) == "ICMP"]
  ingress_tcp  = [for x in var.ingress_rules : x if upper(x.protocol) == "TCP"]
  ingress_udp  = [for x in var.ingress_rules : x if upper(x.protocol) == "UDP"]
  ingress_all  = [for x in var.ingress_rules : x if upper(x.protocol) == "ALL"]
  egress_icmp  = [for x in var.egress_rules : x if upper(x.protocol) == "ICMP"]
  egress_tcp   = [for x in var.egress_rules : x if upper(x.protocol) == "TCP"]
  egress_udp   = [for x in var.egress_rules : x if upper(x.protocol) == "UDP"]
  egress_all   = [for x in var.egress_rules : x if upper(x.protocol) == "ALL"]
}

# ----------------------------------------------------------------------------------------------------------------------
# Ingress Security List
# ----------------------------------------------------------------------------------------------------------------------

resource "oci_core_security_list" "main" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id

  # Optional
  display_name = var.display_name
  dynamic "ingress_security_rules" {
    for_each = local.ingress_tcp
    content {
      protocol  = replace(ingress_security_rules.value.protocol, "TCP", "6")
      source    = lookup(ingress_security_rules.value, "source", "0.0.0.0/0")
      stateless = lookup(ingress_security_rules.value, "stateless", false)

      description = var.description
      tcp_options {
        min = element(split("-", lookup(ingress_security_rules.value, "destination_port_range", 1)), 0)
        max = element(split("-", lookup(ingress_security_rules.value, "destination_port_range", 65535)), 1)
        source_port_range {
          min = element(split("-", lookup(ingress_security_rules.value, "source_port_range", 1)), 0)
          max = element(split("-", lookup(ingress_security_rules.value, "source_port_range", 65535)), 1)
        }
      }
    }
  }

  dynamic "ingress_security_rules" {
    for_each = local.ingress_icmp
    content {
      description = var.Description
      protocol    = replace(ingress_security_rules.value.protocol, "ICMP", "1")
      source      = lookup(ingress_security_rules.value, "source", "0.0.0.0/0")
      stateless   = lookup(ingress_security_rules.value, "stateless", false)

      icmp_options {
        type = lookup(ingress_security_rules.value, "type", 1)
        code = lookup(ingress_security_rules.value, "code", null)
      }
    }
  }

  dynamic "ingress_security_rules" {
    for_each = local.ingress_udp
    content {
      protocol  = replace(ingress_security_rules.value.protocol, "UDP", "17")
      source    = lookup(ingress_security_rules.value, "source", "0.0.0.0/0")
      stateless = lookup(ingress_security_rules.value, "stateless", false)

      description = var.description
      udp_options {

        min = element(split("-", lookup(ingress_security_rules.value, "destination_port_range", 1)), 0)
        max = element(split("-", lookup(ingress_security_rules.value, "destination_port_range", 65535)), 1)

        source_port_range {
          min = element(split("-", lookup(ingress_security_rules.value, "source_port_range", 1)), 0)
          max = element(split("-", lookup(ingress_security_rules.value, "source_port_range", 65535)), 1)
        }
      }
    }
  }

  dynamic "ingress_security_rules" {
    for_each = local.ingress_all
    content {
      protocol    = "all"
      source      = lookup(ingress_security_rules.value, "source", "0.0.0.0/0")
      stateless   = lookup(ingress_security_rules.value, "stateless", false)
      description = var.description
    }
  }

  dynamic "egress_security_rules" {
    for_each = local.egress_tcp
    content {
      destination      = lookup(egress_security_rules.value, "destination", "")
      protocol         = replace(egress_security_rules.value.protocol, "TCP", "6")
      destination_type = lookup(egress_security_rules.value, "destination_type", "CIDR_BLOCK")
      stateless        = lookup(egress_security_rules.value, "stateless", false)

      description = var.description
      tcp_options {
        min = element(split("-", lookup(egress_security_rules.value, "destination_port_range", 1)), 0)
        max = element(split("-", lookup(egress_security_rules.value, "destination_port_range", 65535)), 1)
        source_port_range {
          min = element(split("-", lookup(egress_security_rules.value, "source_port_range", 1)), 0)
          max = element(split("-", lookup(egress_security_rules.value, "source_port_range", 65535)), 1)
        }
      }
    }
  }

  dynamic "egress_security_rules" {
    for_each = local.egress_icmp
    content {
      destination      = lookup(egress_security_rules.value, "destination", "")
      protocol         = replace(egress_security_rules.value.protocol, "ICMP", "1")
      destination_type = lookup(egress_security_rules.value, "destination_type", "CIDR_BLOCK")
      stateless        = lookup(egress_security_rules.value, "stateless", false)
    }
  }

  dynamic "egress_security_rules" {
    for_each = local.egress_udp
    content {
      destination      = lookup(egress_security_rules.value, "destination", "")
      protocol         = replace(egress_security_rules.value.protocol, "UDP", "17")
      destination_type = lookup(egress_security_rules.value, "destination_type", "CIDR_BLOCK")
      stateless        = lookup(egress_security_rules.value, "stateless", false)

      udp_options {

        min = element(split("-", lookup(egress_security_rules.value, "destination_port_range", 1)), 0)
        max = element(split("-", lookup(egress_security_rules.value, "destination_port_range", 65535)), 1)
        source_port_range {
          min = element(split("-", lookup(egress_security_rules.value, "source_port_range", 1)), 0)
          max = element(split("-", lookup(egress_security_rules.value, "source_port_range", 65535)), 1)
        }
      }
    }
  }

  dynamic "egress_security_rules" {
    for_each = local.egress_all
    content {
      destination      = lookup(egress_security_rules.value, "destination", "")
      protocol         = "all"
      destination_type = lookup(egress_security_rules.value, "destination_type", "CIDR_BLOCK")
      stateless        = lookup(egress_security_rules.value, "stateless", false)
    }
  }
}
