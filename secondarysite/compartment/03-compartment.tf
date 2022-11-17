module "compartment_oic_sample_lab_dr" {
  source = "../../modules/compartment"
  #Required
  compartment_id          = var.tenancy_ocid
  compartment_description = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR"
  compartment_name        = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR"
  #Tags
  freeform_tags = {
    "PROJECT"     = "${var.proyecto}"
    "ENTIDAD"     = "${var.environment}"
    "ENVIRONMENT" = "${var.ambiente}"
    "COMPARTMENT" = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR"
    "NAME"        = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR"
  }
}