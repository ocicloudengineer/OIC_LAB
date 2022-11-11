terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.17"
    }
  }
}

#### VAULT ####
resource "oci_kms_vault" "test_vault" {
  #Required
  compartment_id = var.compartment_id != "" ? var.compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
  display_name   = var.display_name
  vault_type     = var.vault_type
}

resource "oci_kms_key" "test_key" {
  #Required
  compartment_id = var.compartment_id != "" ? var.compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
  display_name   = var.display_name
  key_shape {
    #Required
    algorithm = var.key_shape_algorithm
    length    = var.key_shape_length
  }
  management_endpoint = oci_kms_vault.test_vault.management_endpoint

  #Optional
  protection_mode = var.protection_mode
}
