/* terraform {
  #required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.17"
    }
  }
}*/
resource "oci_core_instance" "instance" {
  count          = var.instance_number
  compartment_id = var.instance_compartment_id != "" ? var.instance_compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")

  display_name = var.increment_label == true ? "${var.display_name}${format("%02d", count.index + var.increment_label_start)}" : var.display_name

  shape = var.instance_shape
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = var.user_data
  }

    shape_config {

        #Optional
        memory_in_gbs = "${var.memory_in_gbs}"
        ocpus = "${var.ocpus}"
  }

  availability_domain = var.availability_domain
  fault_domain        = lookup(data.oci_identity_fault_domains.fault_domains.fault_domains[element(var.fault_domain, count.index) != "" ? element(var.fault_domain, count.index) : element(var.fault_domain, 0) - 1], "name")

  create_vnic_details {
    subnet_id        = var.subnet_id == "" ? lookup(data.oci_core_subnets.vcn_subnets.subnets[0], "id") : var.subnet_id
    private_ip       = element(var.private_ip, count.index) != "" ? var.private_ip[count.index] : ""
    nsg_ids          = var.nsg_name == "" ? [] : [data.oci_core_network_security_groups.nsg_result.network_security_groups[0].id]
    assign_public_ip = var.assign_public_ip

  }

  launch_options {
    network_type = var.network_type
  }

  is_pv_encryption_in_transit_enabled = var.instance_is_pv_encryption_in_transit_enabled

  source_details {
    source_type             = "image"
    source_id               = var.image_id[var.region]
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs
    kms_key_id              = var.kms_key
  }

  #Optional
  freeform_tags = var.freeform_tags
}

# resource "oci_core_volume_backup_policy_assignment" "disk_policy_assignment" {
#   count     = var.instance_number
#   asset_id  = element(oci_core_instance.instance.*.boot_volume_id, count.index)
#   policy_id = data.oci_core_volume_backup_policies.boot.volume_backup_policies.0.id
# }