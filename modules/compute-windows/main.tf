terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.17"
    }
  }
}
resource "oci_core_instance" "instance" {
  count               = var.custom_name != true ? var.instance_number : 0
  availability_domain = var.oci_identity_availability_domain
  compartment_id      = var.instance_compartment_id != "" ? var.instance_compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
  display_name        = var.increment_label == true ? "${var.display_name}${format("%02d", count.index + var.increment_label_start)}" : var.display_name
  shape               = var.instance_shape
  #fault_domain        = length(var.fault_domain) > 0 ? var.fault_domain[count.index] : "FAULT-DOMAIN-1" 
  metadata = {
    user_data = element(
      data.template_cloudinit_config.cloudinit_config.*.rendered,
      count.index,
    )
  }

  create_vnic_details {
    subnet_id        = var.subnet_id == "" ? lookup(data.oci_core_subnets.vcn_subnets.subnets[0], "id") : var.subnet_id
    assign_public_ip = var.assign_public_ip
    nsg_ids          = [data.oci_core_network_security_groups.nsg_result.network_security_groups[0].id]
  }

  is_pv_encryption_in_transit_enabled = var.instance_is_pv_encryption_in_transit_enabled

  source_details {
    source_type = "image"
    source_id   = var.image_id
    #boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
  }

  timeouts {
    create = "60m"
  }
  #Optional
  freeform_tags = var.freeform_tags
}
