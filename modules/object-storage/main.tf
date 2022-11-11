terraform {
  #required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.77.0"
    }
  }
}

resource "oci_objectstorage_bucket" "bucket" {
    #Required
    compartment_id = lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
    name = var.bucket_name
    namespace = data.oci_objectstorage_namespace.get_namespace.namespace

    #Optional
    access_type = var.bucket_access_type
    auto_tiering = var.bucket_auto_tiering
    freeform_tags = var.freeform_tags
    kms_key_id = var.kms_key
    storage_tier = var.bucket_storage_tier
    /*
    retention_rules {
        display_name = var.retention_rule_display_name
        duration {
            #Required
            time_amount = var.retention_rule_duration_time_amount
            time_unit = var.retention_rule_duration_time_unit
        }
        time_rule_locked = var.retention_rule_time_rule_locked
    }
    */
    versioning = var.bucket_versioning
}