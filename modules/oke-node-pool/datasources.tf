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

data "oci_core_vcns" "vcns" {
  #Required
  #compartment_id = data.oci_identity_compartments.compartment_vcn.compartment_id
  compartment_id = data.oci_identity_compartments.compartment_vcn.compartments[0].id
}

data "oci_core_subnets" "subnets_worker" {
  compartment_id = data.oci_identity_compartments.compartment_vcn.compartments[0].id
  vcn_id         = data.oci_core_vcns.vcns.virtual_networks[0].id
  filter {
    name   = "display_name"
    values = [var.node_pool_worker_subnet_name]
  }

}

data "oci_containerengine_clusters" "oke_cluster" {
  compartment_id = data.oci_identity_compartments.compartments.compartments[0].id
  filter {
    name   = "state"
    values = ["ACTIVE"]
  }
  filter {
    name   = "name"
    values = [var.cluster_name]
  }
}

