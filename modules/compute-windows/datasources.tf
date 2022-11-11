# Use the cloudinit.ps1 as a template and pass the instance name, user and password as variables to same
data "template_file" "cloudinit_ps1" {
  count = var.custom_name != true ? var.instance_number : 0

  vars = {
    instance_user     = var.instance_user
    instance_password = random_string.instance_password.result
    instance_name     = var.display_name
  }

  template = file("${path.module}/userdata/cloudinit.ps1")
}

data "template_file" "custom_cloudinit_ps1" {
  count = var.custom_name == true ? length(var.custom_display_name) : 0

  vars = {
    instance_user     = var.instance_user
    instance_password = random_string.instance_password.result
    instance_name     = var.custom_display_name[count.index]
  }

  template = file("${path.module}/userdata/cloudinit.ps1")
}


# Cloudinit Config
data "template_cloudinit_config" "cloudinit_config" {
  count = var.custom_name != true ? var.instance_number : 0

  gzip          = false
  base64_encode = true

  # The cloudinit.ps1 uses the #ps1_sysnative to update the instance password and configure winrm for https traffic
  part {
    filename     = var.cloudinit_ps1
    content_type = "text/x-shellscript"
    content      = element(data.template_file.cloudinit_ps1.*.rendered, count.index)
  }

  # The cloudinit.yml uses the #cloud-config to write files remotely into the instance, this is executed as part of instance setup
  part {
    filename     = var.cloudinit_config
    content_type = "text/cloud-config"
    content      = file("${path.module}/userdata/cloudinit.yml")
  }
}

data "template_cloudinit_config" "custom_cloudinit_config" {
  count = var.custom_name == true ? length(var.custom_display_name) : 0

  gzip          = false
  base64_encode = true

  # The cloudinit.ps1 uses the #ps1_sysnative to update the instance password and configure winrm for https traffic
  part {
    filename     = var.cloudinit_ps1
    content_type = "text/x-shellscript"
    content      = element(data.template_file.custom_cloudinit_ps1.*.rendered, count.index)
  }

  # The cloudinit.yml uses the #cloud-config to write files remotely into the instance, this is executed as part of instance setup
  part {
    filename     = var.cloudinit_config
    content_type = "text/cloud-config"
    content      = file("${path.module}/userdata/cloudinit.yml")
  }
}

# Use the setup.ps1 as a template and pass the block volume ipv4 and iqn for ISCSI
data "template_file" "setup_ps1" {
  count = var.disk_volume != "" ? length(var.disk_volume) : 0

  vars = {
    disk_ipv4   = element(var.disk_volume_ipv4, count.index)
    disk_iqn    = element(var.disk_volume_iqn, count.index)
    disk_label  = var.disk_volume_label
    disk_letter = var.disk_volume_letter
  }

  template = file("${path.module}/userdata/setup.ps1")
}


data "oci_core_instance_credentials" "InstanceCredentials" {
  count       = var.custom_name != true ? var.instance_number : 0
  instance_id = element(oci_core_instance.instance.*.id, count.index)
}

data "oci_core_volume_backup_policies" "boot" {
  filter {
    name   = "display_name"
    values = [var.block_vol_backup]
  }
}

# data "oci_identity_availability_domains" "ad" {
#   compartment_id = var.compartment_id
#}


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
    values = [var.instance_compartment_name]
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
    values = [var.network_compartment_name]
  }
}

data "oci_core_vcns" "compartment_vcns" {

  compartment_id = var.vcn_compartment_id != "" ? var.vcn_compartment_id : data.oci_identity_compartments.get_network_compartment.compartments.0.id
  display_name   = var.vcn_name
}

data "oci_core_subnets" "vcn_subnets" {

  compartment_id = var.vcn_compartment_id != "" ? var.vcn_compartment_id : data.oci_identity_compartments.get_network_compartment.compartments.0.id
  vcn_id         = var.vcn_id != "" ? var.vcn_id : data.oci_core_vcns.compartment_vcns.virtual_networks.0.id
  display_name   = var.subnet_name

}


data "oci_core_network_security_groups" "nsg_result" {
  compartment_id = data.oci_identity_compartments.get_network_compartment.compartments[0].id
  display_name   = var.nsg_name
  vcn_id         = data.oci_core_vcns.compartment_vcns.virtual_networks[0].id
}
