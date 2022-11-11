terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.77.0"
    }
  }
}

resource "oci_ons_notification_topic" "notification_topic" {
    #Required
    compartment_id      = var.compartment_id != "" ? var.compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
    name                = var.notification_topic_name

    #Optional
    description         = var.notification_topic_description
    freeform_tags       = var.freeform_tags
}