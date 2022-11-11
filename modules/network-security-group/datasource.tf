data "oci_identity_compartments" "get_network_compartment" {
  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.network_compartment]
  }
}

data "oci_core_vcns" "compartment_vcns" {
  compartment_id = data.oci_identity_compartments.get_network_compartment.compartments[0].id
  display_name   = var.network_vcn
}
