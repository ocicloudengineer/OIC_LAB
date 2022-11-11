output "id" {
  description = "ID do recurso"
  value       = oci_core_ipsec.main.id
}

output "compartment_id" {
  description = " Compartment ID do recurso"
  value       = oci_core_ipsec.main.compartment_id
}

output "cpe_id" {
  description = "CPE ID do recurso"
  value       = oci_core_ipsec.main.cpe_id
}

output "display_name" {
  description = "Nome de Exibição do recurso"
  value       = oci_core_ipsec.main.display_name
}

output "drg_id" {
  description = "DRG ID do recurso"
  value       = oci_core_ipsec.main.drg_id
}

output "state" {
  description = "Estado do recurso"
  value       = oci_core_ipsec.main.state
}

output "static_routes" {
  description = "Rotas Estaticas da VPN"
  value       = oci_core_ipsec.main.static_routes
}

output "time_created" {
  description = "Hora da Criação do recurso"
  value       = oci_core_ipsec.main.time_created
}
