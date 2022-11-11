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
# Internet Gateway
# ----------------------------------------------------------------------------------------------------------------------

resource "oci_core_internet_gateway" "main" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id

  #Optional
  display_name  = var.display_name
  enabled       = var.enabled
  freeform_tags = var.freeform_tags
}
