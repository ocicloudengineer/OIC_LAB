#Compartment Networking
module "compartment_oic_sample_prd_net" {
  source = "../../modules/compartment"
  #Required
  compartment_id          = "${var.parent_lab_dr_compartment_ocid}"
  compartment_description = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_NET"
  compartment_name        = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_NET"
  freeform_tags = {
    "PROJECT"     = "${var.proyecto}"
    "ENTIDAD"     = "${var.environment}"
    "ENVIRONMENT" = "${var.ambiente}"
    "COMPARTMENT" = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_NET"
    "NAME"        = "ORA_TCE_${var.environment}_${var.ambiente}_LAB_DR_NET"
  }
}