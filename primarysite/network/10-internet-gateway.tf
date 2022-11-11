module "internet-gateway" {
  source         = "../../modules/internet-gateway"
  display_name   = "ORA-TCE-${var.environment}-LAB-DR-IGW"
  compartment_id = module.compartment_oic_sample_prd_net.id
  enabled        = true
  vcn_id         = module.vcn_prd_oic.id
  freeform_tags = {
    "PROJECT"     = "${var.proyecto}"
    "ENTIDAD"     = "${var.environment}"
    "ENVIRONMENT" = "${var.ambiente}"
    "COMPARTMENT" = "OR_ASH_${var.environment}_LOY_DEV_COM_NET"
    "NAME"        = "ORASH-${var.environment}-LOY-DEV-IGW"
  }
}