module "oic" {

  for_each = { for i in var.configuration : i.name => i }

  source = "../../modules/oic"
  
  oic_options       = {
    compartment_id  = module.compartment_oic_sample_prd_integration.id
    display_name    = "${var.environment}-${var.proyecto}-${var.region}-${each.key}"
    instance_type   = "ENTERPRISE"
    is_byol         = false
    message_packs   = null
    defined_tags    = null
    freeform_tags   = null
  }

  /* oic_features      = {
    idcs_at                   = "t>SD3ev>4nas<0:U:hEw"
    is_file_server_enabled    = false
    is_visual_builder_enabled = false
  } */
}