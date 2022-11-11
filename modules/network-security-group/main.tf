# terraform {
#   required_version = "~> 1.1.4"
#   required_providers {
#     oci = {
#       source  = "hashicorp/oci"
#       version = "4.17"
#     }
#   }
# }

resource "oci_core_network_security_group" "security_group" {

  display_name = var.security_group_name

  compartment_id = var.network_compartment_id != "" ? var.network_compartment_id : data.oci_identity_compartments.get_network_compartment.compartments[0].id
  vcn_id         = var.network_vcn_id != "" ? var.network_vcn_id : data.oci_core_vcns.compartment_vcns.virtual_networks[0].id
}

locals {
  ingress                       = [for x in var.ingress : x if merge({ destination_port_range = "" }, x).destination_port_range == ""]
  ingress_tcp_ports             = [for x in matchkeys(var.ingress, var.ingress.*.protocol, tolist(["TCP"])) : x if merge({ destination_port_range = "" }, x).destination_port_range != ""]
  ingress_udp_ports             = [for x in matchkeys(var.ingress, var.ingress.*.protocol, tolist(["UDP"])) : x if merge({ destination_port_range = "" }, x).destination_port_range != ""]
  egress                        = [for x in var.egress : x if merge({ source_port_range = "" }, x).source_port_range == "" && merge({ destination_port_range = "" }, x).destination_port_range == ""]
  egress_tcp_ports              = [for x in matchkeys(var.egress, var.egress.*.protocol, tolist(["TCP"])) : x if merge({ source_port_range = "" }, x).source_port_range != ""]
  egress_tcp_ports_destination  = [for x in matchkeys(var.egress, var.egress.*.protocol, tolist(["TCP"])) : x if merge({ destination_port_range = "" }, x).destination_port_range != ""]
  egress_udp_ports              = [for x in matchkeys(var.egress, var.egress.*.protocol, tolist(["UDP"])) : x if merge({ source_port_range = "" }, x).source_port_range != ""]
}

resource "oci_core_network_security_group_security_rule" "ingress" {

  count = length(local.ingress)

  network_security_group_id = oci_core_network_security_group.security_group.id
  direction                 = "INGRESS"
  protocol                  = lookup({ TCP = "6", UDP = "17", ICMP = "1" }, upper(lookup(element(local.ingress, count.index), "protocol")), "all")

  description = lookup(element(local.ingress, count.index), "description", "")
  source_type = lookup(element(local.ingress, count.index), "source_type")
  source      = lookup(element(local.ingress, count.index), "source")
  destination = lookup(element(local.ingress, count.index), "destination", "0.0.0.0/0")

}

resource "oci_core_network_security_group_security_rule" "ingress_tcp_ports" {

  count = length(local.ingress_tcp_ports)

  network_security_group_id = oci_core_network_security_group.security_group.id
  direction                 = "INGRESS"
  protocol                  = "6"
  description               = lookup(element(local.ingress_tcp_ports, count.index), "description", "")
  source_type               = lookup(element(local.ingress_tcp_ports, count.index), "source_type")
  source                    = lookup(element(local.ingress_tcp_ports, count.index), "source")
  destination               = lookup(element(local.ingress_tcp_ports, count.index), "destination", "0.0.0.0/0")

  tcp_options {
    destination_port_range {
      min = element(split("-", lookup(element(local.ingress_tcp_ports, count.index), "destination_port_range")), 0)
      max = element(split("-", lookup(element(local.ingress_tcp_ports, count.index), "destination_port_range")), 1)
    }
  }
}

resource "oci_core_network_security_group_security_rule" "ingress_udp_ports" {

  count = length(local.ingress_udp_ports)

  network_security_group_id = oci_core_network_security_group.security_group.id
  direction                 = "INGRESS"
  protocol                  = "17"
  description               = lookup(element(local.ingress_udp_ports, count.index), "description", "")
  source_type               = lookup(element(local.ingress_udp_ports, count.index), "source_type")
  source                    = lookup(element(local.ingress_udp_ports, count.index), "source")
  destination               = lookup(element(local.ingress_udp_ports, count.index), "destination", "0.0.0.0/0")

  udp_options {
    destination_port_range {
      min = element(split("-", lookup(element(local.ingress_udp_ports, count.index), "destination_port_range")), 0)
      max = element(split("-", lookup(element(local.ingress_udp_ports, count.index), "destination_port_range")), 1)
    }
  }
}

resource "oci_core_network_security_group_security_rule" "egress" {

  count = length(local.egress)

  network_security_group_id = oci_core_network_security_group.security_group.id
  direction                 = "EGRESS"
  protocol                  = lookup({ TCP = "6", UDP = "17", ICMP = "1" }, upper(lookup(element(local.egress, count.index), "protocol")), "all")

  description      = lookup(element(local.egress, count.index), "description", "")
  destination_type = lookup(element(local.egress, count.index), "destination_type")
  destination      = lookup(element(local.egress, count.index), "destination")
  source           = lookup(element(local.egress, count.index), "source", "0.0.0.0/0")

}

resource "oci_core_network_security_group_security_rule" "egress_tcp_ports" {

  count = length(local.egress_tcp_ports)

  network_security_group_id = oci_core_network_security_group.security_group.id
  direction                 = "EGRESS"
  protocol                  = "6"

  description      = lookup(element(local.egress_tcp_ports, count.index), "description", "")
  destination_type = lookup(element(local.egress_tcp_ports, count.index), "destination_type")
  destination      = lookup(element(local.egress_tcp_ports, count.index), "destination")
  source           = lookup(element(local.egress_tcp_ports, count.index), "source", "0.0.0.0/0")

  tcp_options {
    source_port_range {
      min = element(split("-", lookup(element(local.egress_tcp_ports, count.index), "source_port_range")), 0)
      max = element(split("-", lookup(element(local.egress_tcp_ports, count.index), "source_port_range")), 1)
    }
  }
}

resource "oci_core_network_security_group_security_rule" "egress_tcp_ports_destination" {

  count = length(local.egress_tcp_ports_destination)

  network_security_group_id = oci_core_network_security_group.security_group.id
  direction                 = "EGRESS"
  protocol                  = "6"

  description      = lookup(element(local.egress_tcp_ports_destination, count.index), "description", "")
  destination_type = lookup(element(local.egress_tcp_ports_destination, count.index), "destination_type")
  destination      = lookup(element(local.egress_tcp_ports_destination, count.index), "destination")
  source           = lookup(element(local.egress_tcp_ports_destination, count.index), "source", "0.0.0.0/0")

  tcp_options {
    destination_port_range {
      min = element(split("-", lookup(element(local.egress_tcp_ports_destination, count.index), "destination_port_range")), 0)
      max = element(split("-", lookup(element(local.egress_tcp_ports_destination, count.index), "destination_port_range")), 1)
    }
  }
}

resource "oci_core_network_security_group_security_rule" "egress_udp_ports" {

  count = length(local.egress_udp_ports)

  network_security_group_id = oci_core_network_security_group.security_group.id
  direction                 = "EGRESS"
  protocol                  = "17"

  description      = lookup(element(local.egress_udp_ports, count.index), "description", "")
  destination_type = lookup(element(local.egress_udp_ports, count.index), "destination_type")
  destination      = lookup(element(local.egress_udp_ports, count.index), "destination")
  source           = lookup(element(local.egress_udp_ports, count.index), "source", "0.0.0.0/0")

  udp_options {
    source_port_range {
      min = element(split("-", lookup(element(local.egress_udp_ports, count.index), "source_port_range")), 0)
      max = element(split("-", lookup(element(local.egress_udp_ports, count.index), "source_port_range")), 1)
    }
  }
}
