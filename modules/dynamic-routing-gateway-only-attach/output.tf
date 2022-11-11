output "drg_attach_id" {
  description = "ID do recurso"
  value       = oci_core_drg_attachment.main.id
}

output "drg_attach_drg_id" {
  description = "DRG ID do recurso"
  value       = oci_core_drg_attachment.main.drg_id
}

output "drg_attach_route_table_id" {
  description = "Route Table ID do recurso"
  value       = oci_core_drg_attachment.main.route_table_id
}

output "drg_attach_vcn_id" {
  description = "VCN ID do recurso"
  value       = oci_core_drg_attachment.main.vcn_id
}

output "drg_attach_compartment_id" {
  description = "Compartment ID do recurso"
  value       = oci_core_drg_attachment.main.compartment_id
}

output "drg_attach_display_name" {
  description = "Display Name do recurso"
  value       = oci_core_drg_attachment.main.display_name
}

output "drg_attach_state" {
  description = "State do recurso"
  value       = oci_core_drg_attachment.main.state
}

output "drg_attach_time_created" {
  description = "Hora da Criação"
  value       = oci_core_drg_attachment.main.time_created
}
