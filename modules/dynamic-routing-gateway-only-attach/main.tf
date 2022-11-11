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
# Dynamic Routing Gateway
# ----------------------------------------------------------------------------------------------------------------------

resource "oci_core_drg_attachment" "main" {
  drg_id = var.drg_id
  vcn_id = var.vcn_id

  #Optional
  display_name   = var.drg_attach_display_name
  route_table_id = var.route_table_id
}
