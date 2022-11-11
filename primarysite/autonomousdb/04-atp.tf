module "oic" {

  for_each = { for i in var.configuration : i.name => i }

  source = "../../modules/oic"
  
  oic_options       = {
    compartment_id  = module.compartment_oic_sample_prd_integration.id
    display_name    = "${var.environment}-${var.project}-${var.reg}-${each.key}"
    instance_type   = "ENTERPRISE"
    is_byol         = false
    message_packs   = null
    defined_tags    = null
    freeform_tags   = null
  }

  oic_features      = {
    idcs_at                   = "}b8cvzEE3y#QlQ968zF>"
    is_file_server_enabled    = false
    is_visual_builder_enabled = false
  }
}