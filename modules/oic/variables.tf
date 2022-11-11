# Global variables
variable "default_compartment_id" {
  type              = string
  description       = "The default compartment OCID to use for resources (unless otherwise specified)."
  default           = "ocid1.compartment.oc1..aaaaaaaa7npsganuom4y7yqdqg3jzpaudvgsq4b36exzlxer4raqr55a6j4a"
}

# OIC-specific variables
variable "oic_options" {
  type              = object({
    display_name    = string,
    compartment_id  = string,
    instance_type   = string,
    is_byol         = bool,
    message_packs   = string,
    defined_tags    = map(string),
    freeform_tags   = map(string)
  })
  description       = "Parameters for customizing OIC"
  default           = {
    display_name    = null
    compartment_id  = null
    instance_type   = null
    is_byol         = null
    message_packs   = null
    defined_tags    = null
    freeform_tags   = null
  }
}

# OIC-features
variable "oic_features" {
  type                          = object({
    idcs_at                     = string,
    is_file_server_enabled      = bool,
    is_visual_builder_enabled   = bool
  })
  description                   = "Parameters for customizing OIC features"
  default                       = {
    idcs_at                     = null
    is_file_server_enabled      = null
    is_visual_builder_enabled   = null
  }
}