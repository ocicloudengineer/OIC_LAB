terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.17"
    }
  }
}

# ----------------------------------------------------------------------------------------------------------------------
# VCN Local Peering
# ----------------------------------------------------------------------------------------------------------------------

resource "oci_core_local_peering_gateway" "main" {
  #Required
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id

  #Optional
  display_name   = var.display_name
  peer_id        = var.peer_id
  route_table_id = var.route_table_id
  freeform_tags  = var.freeform_tags
}
