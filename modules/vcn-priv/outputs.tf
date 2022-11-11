output "id" {
  description = "ID do recurso"
  value       = oci_core_vcn.main.id
}

output "cidr_block" {
  description = "CIDR Block"
  value       = oci_core_vcn.main.cidr_block
}

output "compartment_id" {
  value       = oci_core_vcn.main.compartment_id
  description = "Compartment Id from Resource"
}


output "default_dhcp_options_id" {
  value       = oci_core_vcn.main.default_dhcp_options_id
  description = "DHCP Option"
}


output "default_route_table_id" {
  value       = oci_core_vcn.main.default_route_table_id
  description = "Route Table ID"
}

output "default_security_list_id" {
  value       = oci_core_vcn.main.default_security_list_id
  description = "Default Security List"
}

output "defined_tags" {
  value       = oci_core_vcn.main.defined_tags
  description = "Defined Tags"
}


output "display_name" {
  value       = oci_core_vcn.main.display_name
  description = "Display Name"
}


output "dns_label" {
  value       = oci_core_vcn.main.dns_label
  description = "DNS Label"
}


output "freeform_tags" {
  value       = oci_core_vcn.main.freeform_tags
  description = "FreeForm Tags"
}

# output "ipv6cidr_block" {
#   value       = oci_core_vcn.main.ipv6cidr_block
#   description = "IPV6 Block"
# }


# output "ipv6public_cidr_block" {
#   value       = oci_core_vcn.main.ipv6public_cidr_block
#   description = "IPV6 Block Public"
# }


output "state" {
  value       = oci_core_vcn.main.state
  description = "VCN's State"
}


output "time_created" {
  value       = oci_core_vcn.main.time_created
  description = "VCN time_created"
}

output "vcn_domain_name" {
  value       = oci_core_vcn.main.vcn_domain_name
  description = "VCN Domain Name"
}

# output "nat_gateway_id" {
#   value       = oci_core_nat_gateway.main.id
#   description = "Nat Gateway ID"
# }
