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

resource "oci_file_storage_file_system" "file_systems" {
  #Required
  compartment_id      = var.compartment_id != "" ? var.compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
  availability_domain = var.availability_domain

  #Optional
  display_name  = var.display_name
  freeform_tags = var.freeform_tags
}

resource "oci_file_storage_mount_target" "mount_target" {
  #Required
  compartment_id      = var.compartment_id != "" ? var.compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
  availability_domain = var.availability_domain
  subnet_id           = var.subnet_id != "" ? var.subnet_id : data.oci_core_subnets.subnet.subnets[0].id
  #Optional
  display_name   = var.display_name_mt
  freeform_tags  = var.freeform_tags
  hostname_label = var.hostname_label
  ip_address     = var.ip_address
  nsg_ids        = [data.oci_core_network_security_groups.nsg_result.network_security_groups[0].id]
}
