module "compartment_oic_sample_prd_integration" {
  source = "../../modules/compartment"
  #Required
  compartment_id          = "${var.parent_lab_dr_compartment_ocid}"
  compartment_description = "ORA_TCE_${var.environment}_LAB_DR_ATP"
  compartment_name        = "ORA_TCE_${var.environment}_LAB_DR_ATP"
  freeform_tags = {
    "PROJECT"     = "${var.proyecto}"
    "ENTIDAD"     = "${var.environment}"
    "ENVIRONMENT" = "${var.ambiente}"
    "COMPARTMENT" = "ORA_TCE_${var.environment}_LAB_DR_ATP"
    "NAME"        = "ORA_TCE_${var.environment}_LAB_DR_ATP"
  }
}