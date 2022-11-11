output "id" {
  description = "ID do recurso"
  value       = oci_core_subnet.main.id
}

output "display_name" {
  value       = oci_core_subnet.main.display_name
  description = "Display Name"
}


output "availability_domain" {
  value       = oci_core_subnet.main.availability_domain
  description = "Availability Domain"
}


output "cidr_block" {
  value       = oci_core_subnet.main.cidr_block
  description = "CIDR Block"
}


output "compartment_id" {
  value       = oci_core_subnet.main.compartment_id
  description = "Compartment ID"
}


output "defined_tags" {
  value       = oci_core_subnet.main.defined_tags
  description = "Defined Tags"
}


output "dhcp_options_id" {
  value       = oci_core_subnet.main.dhcp_options_id
  description = "DHCP Options"
}


output "dns_label" {
  value       = oci_core_subnet.main.dns_label
  description = "DNS Labels"
}


output "freeform_tags" {
  value       = oci_core_subnet.main.freeform_tags
  description = "Freeform Tags"
}


# output "ipv6cidr_block" {
#   value       = oci_core_subnet.main.ipv6cidr_block
#   description = "IPV6 CIDr Block"
# }


# output "ipv6public_cidr_block" {
#   value       = oci_core_subnet.main.ipv6public_cidr_block
#   description = "IPV6 CIDR Public"
# }


output "ipv6virtual_router_ip" {
  value       = oci_core_subnet.main.ipv6virtual_router_ip
  description = "IPV6 Router IP"
}


output "prohibit_public_ip_on_vnic" {
  value       = oci_core_subnet.main.prohibit_public_ip_on_vnic
  description = "Public IP on VNIC"
}


output "route_table_id" {
  value       = oci_core_subnet.main.route_table_id
  description = "Route Table"
}


output "state" {
  value       = oci_core_subnet.main.state
  description = "State"
}


output "subnet_domain_name" {
  value       = oci_core_subnet.main.subnet_domain_name
  description = "Subnet Domain"
}


output "time_created" {
  value       = oci_core_subnet.main.time_created
  description = "Time Created"
}


output "vcn_id" {
  value       = oci_core_subnet.main.vcn_id
  description = "VCN ID"
}


output "virtual_router_ip" {
  value       = oci_core_subnet.main.virtual_router_ip
  description = "Virtual Router IP"
}


output "virtual_router_mac" {
  value       = oci_core_subnet.main.virtual_router_mac
  description = "Virtual Router Mac"
}
