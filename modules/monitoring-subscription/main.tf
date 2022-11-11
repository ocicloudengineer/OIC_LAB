terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.77.0"
    }
  }
}

resource "oci_ons_subscription" "notification_subscription" {
    #Required
    compartment_id      = var.compartment_id != "" ? var.compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
    endpoint            = var.subscription_endpoint
    protocol            = var.subscription_protocol
    topic_id            = var.notification_topic_id != "" ? var.notification_topic_id : lookup(data.oci_ons_notification_topics.get_topic.notification_topics[0], "topic_id")

    #Optional
    freeform_tags       = var.freeform_tags
    
}
