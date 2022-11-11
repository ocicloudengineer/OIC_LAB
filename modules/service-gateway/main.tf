# terraform {
#   required_version = "~> 1.1.4"
#   required_providers {
#     oci = {
#       source  = "hashicorp/oci"
#       version = "4.17"
#     }
#   }
# }
data "oci_core_services" "services" {
}

resource "oci_core_service_gateway" "service_gateway" {
  #Required
  compartment_id = var.compartment_id
  services {
    service_id = data.oci_core_services.services.services.1.id
  }
  vcn_id       = var.vcn_id
  display_name = var.display_name
  #Optional
  freeform_tags = var.freeform_tags
}
