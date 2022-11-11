output "id" {
  description = "ID do recurso"
  value       = oci_core_security_list.main.id
}

output "state" {
  description = "State do recurso"
  value       = oci_core_security_list.main.state
}

output "compartment_id" {
  description = "Comaprtment ID do recurso"
  value       = oci_core_security_list.main.compartment_id
}

output "display_name" {
  description = "Nome de Exibição do recurso"
  value       = oci_core_security_list.main.display_name
}

output "ingress_security_rules_source" {
  description = "Ingress ICMP Security Rules Source do recurso"
  value       = oci_core_security_list.main.ingress_security_rules.*.source
}

output "ingress_security_rules_protocol" {
  description = "Protocolo do recurso"
  value       = oci_core_security_list.main.ingress_security_rules.*.protocol
}

output "ingress_security_rules_stateless" {
  description = "Stateless do recurso"
  value       = oci_core_security_list.main.ingress_security_rules.*.stateless
}


output "ingress_security_rules_tcp_options" {
  description = "TCP Options do recurso"
  value       = oci_core_security_list.main.ingress_security_rules.*.tcp_options
}

output "ingress_security_rules_udp_options" {
  description = "UDP Options do recurso"
  value       = oci_core_security_list.main.ingress_security_rules.*.udp_options
}

output "ingress_security_rules_icmp_options" {
  description = "ICMP Options do recurso"
  value       = oci_core_security_list.main.ingress_security_rules.*.icmp_options
}
