module "service-gateway" {
  source         = "../../modules/service-gateway/"
  compartment_id = module.compartment_oic_sample_prd_net.id
  vcn_id         = module.vcn_prd_oic.id
  display_name   = "ORA-TCE-${var.environment}-LAB-DR-SGW"
  freeform_tags = {
    "PROJECT"     = "${var.proyecto}"
    "ENTIDAD"     = "${var.environment}"
    "ENVIRONMENT" = "${var.ambiente}"
    "COMPARTMENT" = "ORA_TCE_${var.environment}_LAB_DR_COM_NET"
    "NAME"        = "ORA-TCE-${var.environment}-LAB-DR-SGW"
  }
}