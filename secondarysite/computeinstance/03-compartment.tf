module "compartment_oic_sample_prd_agent" {
  source = "../../modules/compartment"
  #Required
  compartment_id          = "${var.parent_lab_dr_compartment_ocid}"
  compartment_description = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_AGENT"
  compartment_name        = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_AGENT"
  freeform_tags = {
    "PROJECT"     = "${var.proyecto}"
    "ENTIDAD"     = "${var.environment}"
    "ENVIRONMENT" = "${var.ambiente}"
    "COMPARTMENT" = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_AGENT"
    "NAME"        = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_AGENT"
  }
}