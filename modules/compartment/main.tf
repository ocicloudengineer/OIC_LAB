terraform {
  # required_version = "~> 1.1.4"
  required_providers {
    # oci = {
    #   source  = "hashicorp/oci"
    #   version = "4.17"
    # }
  }
}

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
# compartment
# ----------------------------------------------------------------------------------------------------------------------

resource "oci_identity_compartment" "main" {
  #Required
  compartment_id = var.compartment_id
  description    = var.compartment_description
  name           = var.compartment_name
  #Optional
  freeform_tags = var.freeform_tags

}
