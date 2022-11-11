data "oci_integration_integration_instances" "test_integration_instances" {
    #Required
    compartment_id = var.default_compartment_id
}