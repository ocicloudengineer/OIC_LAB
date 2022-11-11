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
# subnet
# ----------------------------------------------------------------------------------------------------------------------

resource "oci_core_subnet" "main" {
  #Required
  cidr_block     = var.subnet_cidr_block
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id

  #Optional
  availability_domain        = var.subnet_availability_domain
  dhcp_options_id            = var.dhcp_options_id
  display_name               = var.display_name
  dns_label                  = var.subnet_dns_label
  freeform_tags              = var.freeform_tags
  ipv6cidr_block             = var.subnet_ipv6cidr_block
  prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
  route_table_id             = var.route_table_id
  security_list_ids          = var.subnet_security_list_ids

}
