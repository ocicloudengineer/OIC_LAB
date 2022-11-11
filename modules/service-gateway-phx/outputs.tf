output "id" {
  description = "ID do recurso"
  value       = oci_core_service_gateway.service_gateway.id
}

output "state" {
  description = "Estado do recurso"
  value       = oci_core_service_gateway.service_gateway.state
}

output "vcn_id" {
  description = "VCN ID do recurso"
  value       = oci_core_service_gateway.service_gateway.vcn_id
}

output "time_created" {
  description = "Hora da Criação do Recurso"
  value       = oci_core_service_gateway.service_gateway.time_created
}

output "display_name" {
  description = "Nome de Exibição do recurso"
  value       = oci_core_service_gateway.service_gateway.display_name
}


