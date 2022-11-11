#agents for oic conectivity in HA

module "tf-oci-module-instance-prd-labdroic-agent-000" {
  source                                       = "../../modules/compute"
  region                                       = var.region
  tenancy_ocid                                 = var.tenancy_ocid
  instance_number                              = "1"
  network_compartment_name                     = "ORA_TCE_OIC_LAB_DR_NET"
  instance_compartment_id                      = module.compartment_oic_sample_prd_agent.id
  hostname_label                               = "ORA${var.environmentstname}${var.app}${var.resourceapp}000"
  display_name                                 = "ORA${var.environmentstname}${var.app}${var.resourceapp}000"
  image_id                                     = { us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaacp5tdxwiwuvhejncd3wcqcpnyll6kcs64zxloqej2frwnjbhhceq" }
  availability_domain                          = var.ad1
  instance_shape                               = var.instanceshapeapp
  ocpus                                        = "1"
  memory_in_gbs                                = "8"
  ssh_user                                     = "opc"
  ssh_public_key                               = file("../keys/id_rsa_usb_pr_prd.pub")
  ssh_private_key                              = file("../keys/id_rsa_usb_pr_prd")
  private_ip                                   = [""]
  assign_public_ip                             = "false"
  subnet_name                                  = "ORA-TCE-${var.environment}-LAB-DR-SUB-PRI"
  vcn_name                                     = "ORA-TCE-${var.environment}-LAB-DR-VCN"
  boot_volume_size_in_gbs                      = "50"
  disk_boot_backup                             = ""
  instance_is_pv_encryption_in_transit_enabled = "true"
  nsg_name                                     = "ORA-TCE-${var.ambiente}-${var.proyecto}-${var.region}-NSG-SEC-AGN"
}

module "tf-oci-module-instance-prd-labdroic-agent-001" {
  source                                       = "../../modules/compute"
  region                                       = var.region
  tenancy_ocid                                 = var.tenancy_ocid
  instance_number                              = "1"
  network_compartment_name                     = "ORA_TCE_OIC_LAB_DR_NET"
  instance_compartment_id                      = module.compartment_oic_sample_prd_agent.id
  hostname_label                               = "ORA${var.environmentstname}${var.app}${var.resourceapp}001"
  display_name                                 = "ORA${var.environmentstname}${var.app}${var.resourceapp}001"
  image_id                                     = { us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaacp5tdxwiwuvhejncd3wcqcpnyll6kcs64zxloqej2frwnjbhhceq" }
  availability_domain                          = var.ad2
  instance_shape                               = var.instanceshapeapp
  ocpus                                        = "1"
  memory_in_gbs                                = "8"
  ssh_user                                     = "opc"
  ssh_public_key                               = file("../keys/id_rsa_usb_pr_prd.pub")
  ssh_private_key                              = file("../keys/id_rsa_usb_pr_prd")
  private_ip                                   = [""]
  assign_public_ip                             = "false"
  subnet_name                                  = "ORA-TCE-${var.environment}-LAB-DR-SUB-PRI"
  vcn_name                                     = "ORA-TCE-${var.environment}-LAB-DR-VCN"
  boot_volume_size_in_gbs                      = "50"
  disk_boot_backup                             = ""
  instance_is_pv_encryption_in_transit_enabled = "true"
  nsg_name                                     = "ORA-TCE-${var.ambiente}-${var.proyecto}-${var.region}-NSG-SEC-AGN"
}