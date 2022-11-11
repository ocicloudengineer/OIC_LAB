data "oci_containerengine_cluster_kube_config" "main" {
  #Required
  cluster_id = oci_containerengine_cluster.main.id
}

data "oci_identity_compartments" "compartments" {
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

data "oci_identity_compartments" "compartment_vcn" {
  #Required
  compartment_id = data.oci_identity_compartments.compartments.compartments[0].id
}

data "oci_core_vcns" "vcn" {
  #Required
  compartment_id = data.oci_identity_compartments.compartment_vcn.compartments[0].id
}

data "oci_core_subnets" "subnet" {
  #Required
  compartment_id = data.oci_identity_compartments.compartment_vcn.compartments[0].id

  #Optional
  display_name = var.subnet_display_name
  vcn_id       = data.oci_core_vcns.vcn.virtual_networks[0].id
}
