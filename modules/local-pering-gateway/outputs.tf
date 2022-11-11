# ----------------------------------------------------------------------------------------------------------------------

output "compartment_id" {
  description = "Compartment ID do recurso"
  value       = oci_core_local_peering_gateway.main.compartment_id
}

output "defined_tags" {
  description = "Defined Tags do recurso"
  value       = oci_core_local_peering_gateway.main.defined_tags
}

output "display_name" {
  description = "Nome de Exibição do recurso"
  value       = oci_core_local_peering_gateway.main.display_name
}

output "freeform_tags" {
  description = "Tags "
  value       = oci_core_local_peering_gateway.main.freeform_tags
}

output "id" {
  description = "ID do recurso"
  value       = oci_core_local_peering_gateway.main.id
}

output "is_cross_tenancy_peering" {
  description = "Tenancy Peering"
  value       = oci_core_local_peering_gateway.main.is_cross_tenancy_peering
}

output "peer_advertised_cidr" {
  description = "Rede CIDR cadastrada do recurso"
  value       = oci_core_local_peering_gateway.main.peer_advertised_cidr
}

output "peer_advertised_cidr_details" {
  description = "Detalhes do CIDR do Peer"
  value       = oci_core_local_peering_gateway.main.peer_advertised_cidr_details
}

output "peering_status" {
  description = "Status do Peering"
  value       = oci_core_local_peering_gateway.main.peering_status
}

output "peering_status_details" {
  description = "Detalhes do Peering"
  value       = oci_core_local_peering_gateway.main.peering_status_details
}

output "route_table_id" {
  description = "Route Table ID"
  value       = oci_core_local_peering_gateway.main.route_table_id
}

output "state" {
  description = "Estado do recurso"
  value       = oci_core_local_peering_gateway.main.state
}

output "time_created" {
  description = "Time Created"
  value       = oci_core_local_peering_gateway.main.time_created
}

output "vcn_id" {
  description = "VCN ID"
  value       = oci_core_local_peering_gateway.main.vcn_id
}

