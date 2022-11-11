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
    values = [var.network_compartment_name]
  }
}

data "oci_core_ipsec_connection_tunnels" "tunnels" {
  #Required
  ipsec_id = oci_core_ipsec.main.id
}

/*data "oci_core_cpe_device_shapes" "test_cpe_device_shapes" {
}

data "oci_core_cpe_device_shape" "test_cpe_device_shape" {
    #Required
    cpe_device_shape_id = oci_core_cpe_device_shape.test_cpe_device_shape.id
}*/
