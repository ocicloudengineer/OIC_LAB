#VCN primary site
module "vcn_prd_oic" {
  source         = "../../modules/vcn-priv"
  cidr_block     = "172.100.10.0/24"
  compartment_id = module.compartment_oic_sample_prd_net.id
  vcn_dns_label    = "vcnprodoic"
  name             = "ORA-TCE-${var.environment}-LAB-DR-VCN"
  #display_name_nat = "ORA-TCE-${var.environment}-LAB-DR-NGW"

  freeform_tags = {
    "PROJECT"     = "${var.proyecto}"
    "ENTIDAD"     = "${var.environment}"
    "ENVIRONMENT" = "${var.ambiente}"
    "COMPARTMENT" = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_NET"
    "NAME"        = "ORA-TCE-${var.environment}-LA-DR-VCN"
  }
}