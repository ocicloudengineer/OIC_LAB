output "load_balancer_id" {
  value       = oci_load_balancer_load_balancer.load_balancer.id
  description = "Id do Load Balancer"
}

output "load_balancer_display_name" {
  value       = oci_load_balancer_load_balancer.load_balancer.display_name
  description = "Nome do Load Balancer"
}

output "load_balancer_ip_address_details" {
  value       = oci_load_balancer_load_balancer.load_balancer.ip_address_details
  description = "Detalhes de IP do Load Balancer"
}

output "load_balancer_is_private" {
  value       = oci_load_balancer_load_balancer.load_balancer.is_private
  description = "Se o Load Balancer é privado"
}

output "load_balancer_network_security_group_ids" {
  value       = oci_load_balancer_load_balancer.load_balancer.network_security_group_ids
  description = "Network Security Group do Load Balancer"
}

output "load_balancer_shape" {
  value       = oci_load_balancer_load_balancer.load_balancer.shape
  description = "Shape do Load Balancer"
}

output "load_balancer_subnet_ids" {
  value       = oci_load_balancer_load_balancer.load_balancer.subnet_ids
  description = "Subnet Ids do Load Balancer"
}
