output "nsg_id" {
  value = oci_core_network_security_group.security_group.id
}

output "outputs" {
  value = {
    ingress           = local.ingress
    ingress_tcp_ports = local.ingress_tcp_ports
    ingress_udp_ports = local.ingress_udp_ports
    egress            = local.egress
    egress_tcp_ports  = local.egress_tcp_ports
    egress_udp_ports  = local.egress_udp_ports
  }
}
