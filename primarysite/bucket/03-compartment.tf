module "compartment_oic_sample_bucket" {
  source = "../../modules/compartment"
  #Required
  compartment_id          = "${var.parent_lab_dr_compartment_ocid}"
  compartment_description = "ORA_${var.environment}_LAB_DR_BUCKET"
  compartment_name        = "ORA_${var.environment}_LAB_DR_BUCKET"
  freeform_tags = {
    "PROJECT"     = "${var.proyecto}"
    "ENTIDAD"     = "${var.environment}"
    "ENVIRONMENT" = "${var.ambiente}"
    "COMPARTMENT" = "ORA_${var.environment}_LAB_DR_BUCKET"
    "NAME"        = "ORA_${var.environment}_LAB_DR_BUCKET"
  }
}