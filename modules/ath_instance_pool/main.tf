variable compartment_ocid {}
variable instance_configuration_id {}
variable availability_domain {}
variable subnet_id {}
variable display_name {}
variable size {}

resource oci_core_instance_pool oci_core_instance_pool_res {
  compartment_id            = var.compartment_ocid
  instance_configuration_id = var.instance_configuration_id
  display_name              = var.display_name
  placement_configurations {
    availability_domain = var.availability_domain
    primary_subnet_id   = var.subnet_id
  }
  size = var.size
}