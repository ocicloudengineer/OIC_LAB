data "oci_identity_compartments" "get_compartment" {

  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.compartment_name]
  }
}

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

data "oci_core_vcns" "vcn" {
  #Required
  compartment_id = data.oci_identity_compartments.get_network_compartment.compartments[0].id
}

data "oci_core_subnets" "subnet" {
  #Required
  compartment_id = data.oci_identity_compartments.get_network_compartment.compartments[0].id
  #Optional
  display_name = var.subnet_display_name
  vcn_id       = data.oci_core_vcns.vcn.virtual_networks[0].id
}

data "oci_core_network_security_groups" "nsg_result" {
  compartment_id = data.oci_identity_compartments.get_network_compartment.compartments[0].id
  display_name   = var.nsg_name
  vcn_id         = data.oci_core_vcns.vcn.virtual_networks[0].id
}
