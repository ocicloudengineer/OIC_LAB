data "oci_identity_compartments" "compartment" {
  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.compartment_name_peer]
  }
}

data "oci_core_vcns" "vcn" {
  #Required
  compartment_id = data.oci_identity_compartments.compartment.compartments[0].id
}

data "oci_core_local_peering_gateways" "lpg_peering" {
  compartment_id = data.oci_identity_compartments.compartment.compartments[0].id
  vcn_id         = data.oci_core_vcns.vcn.virtual_networks[0].id
  filter {
    name   = "display_name"
    values = [var.lpg_peer_name]
  }
}

