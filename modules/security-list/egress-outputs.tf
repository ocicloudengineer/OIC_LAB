output "egress_security_rules_destination" {
  description = "Egress ICMP Security Rules Protocol do recurso"
  value       = oci_core_security_list.main.egress_security_rules.*.protocol
}

output "egress_security_rules_destination_type" {
  description = "Egress ICMP Security Rules Destination do recurso"
  value       = oci_core_security_list.main.egress_security_rules.*.destination
}

output "egress_security_rules_protocol" {
  description = "TCP Protocolo do recurso"
  value       = oci_core_security_list.main.egress_security_rules.*.protocol
}

output "egress_security_rules_stateless" {
  description = "ICMP Stateless do recurso"
  value       = oci_core_security_list.main.egress_security_rules.*.stateless
}

output "egress_security_rules_tcp_options" {
  description = "TCP Options do recurso"
  value       = oci_core_security_list.main.egress_security_rules.*.tcp_options
}

output "egress_security_rules_udp_options" {
  description = "UDP Options do recurso"
  value       = oci_core_security_list.main.egress_security_rules.*.udp_options
}

output "egress_security_rules_icmp_options" {
  description = "ICMP Options do recurso"
  value       = oci_core_security_list.main.egress_security_rules.*.icmp_options
}
