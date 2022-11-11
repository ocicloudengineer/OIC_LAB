# terraform {
#   required_version = "~> 1.1.4"
#   required_providers {
#     oci = {
#       source  = "hashicorp/oci"
#       version = "4.17"
#     }
#   }
# }

# ----------------------------------------------------------------------------------------------------------------------
# Locals
# ----------------------------------------------------------------------------------------------------------------------

locals {
  identifier = lower(var.name)
  common_tags_values = zipmap(
    formatlist(
      "%s.%s",
      var.common_tags_values["Namespace"],
      keys(var.common_tags_values),
    ),
    values(var.common_tags_values),
  )
}

# ----------------------------------------------------------------------------------------------------------------------
# vcn
# ----------------------------------------------------------------------------------------------------------------------

resource "oci_core_vcn" "main" {
  #Required
  cidr_block     = var.cidr_block
  compartment_id = var.compartment_id

  #Optional
  display_name   = var.name
  dns_label      = var.vcn_dns_label
  freeform_tags  = var.freeform_tags
  #ipv6cidr_blocks = var.ipv6cidr
  #is_ipv6enabled = var.ipv6enable

}

# resource "oci_core_nat_gateway" "main" {
#   #Required
#   compartment_id = var.compartment_id
#   vcn_id         = oci_core_vcn.main.id
#   display_name   = var.display_name_nat
#   #Optional
#   freeform_tags = var.freeform_tags
# }
/*
resource "oci_core_default_route_table" "default-route-table" {
  manage_default_resource_id = oci_core_vcn.main.default_route_table_id

  route_rules {
      #Required
      network_entity_id = oci_core_internet_gateway.main.id

      #Optional
      cidr_block = "0.0.0.0/0"
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
  }
}*/
