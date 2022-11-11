#################
# Options
#################
# default values
locals {
  oic_options_defaults = {
    state               = "ACTIVE"
    consumption_model   = null
    message_packs       = 1
    defined_tags        = {}
    freeform_tags       = {}
  }
}

#################
# Features
#################
# default values
locals {
  oic_features_defaults = {
    idcs_at                     = "}b8cvzEE3y#QlQ968zF>"
    is_file_server_enabled      = null
    is_visual_builder_enabled   = null
  }
}

# resource definition
resource "oci_integration_integration_instance" "this" {
    count                       = var.oic_options == null ? 0 : length(var.oic_options) > 0 ? 1 : 0
    #Required
    compartment_id              = var.oic_options.compartment_id
    display_name                = var.oic_options.display_name
    integration_instance_type   = var.oic_options.instance_type
    is_byol                     = var.oic_options.is_byol
    message_packs               = var.oic_options.message_packs != null ? var.oic_options.message_packs : local.oic_options_defaults.message_packs
    defined_tags                = var.oic_options.defined_tags != null ? var.oic_options.defined_tags : local.oic_options_defaults.defined_tags
    freeform_tags               = var.oic_options.freeform_tags != null ? var.oic_options.freeform_tags : local.oic_options_defaults.freeform_tags

    #Features
    idcs_at = var.oic_features.idcs_at != null ? var.oic_features.idcs_at : local.oic_features_defaults.idcs_at
    is_file_server_enabled = var.oic_features.is_file_server_enabled != null ? var.oic_features.is_file_server_enabled : local.oic_features_defaults.is_file_server_enabled
    is_visual_builder_enabled = var.oic_features.is_visual_builder_enabled != null ? var.oic_features.is_visual_builder_enabled : local.oic_features_defaults.is_visual_builder_enabled

/*
    #Optional
    alternate_custom_endpoints {
        #Required
        hostname = var.integration_instance_alternate_custom_endpoints_hostname

        #Optional
        certificate_secret_id = oci_vault_secret.test_secret.id
    }
    consumption_model = local.oic_options_defaults.consumption_model
    custom_endpoint {
        #Required
        hostname = var.integration_instance_custom_endpoint_hostname

        #Optional
        certificate_secret_id = oci_vault_secret.test_secret.id
    }
    
    network_endpoint_details {
        #Required
        network_endpoint_type = var.integration_instance_network_endpoint_details_network_endpoint_type

        #Optional
        allowlisted_http_ips = var.integration_instance_network_endpoint_details_allowlisted_http_ips
        allowlisted_http_vcns {
            #Required
            id = var.integration_instance_network_endpoint_details_allowlisted_http_vcns_id

            #Optional
            allowlisted_ips = var.integration_instance_network_endpoint_details_allowlisted_http_vcns_allowlisted_ips
        }
        is_integration_vcn_allowlisted = var.integration_instance_network_endpoint_details_is_integration_vcn_allowlisted
    }
*/
    state = local.oic_options_defaults.state
}