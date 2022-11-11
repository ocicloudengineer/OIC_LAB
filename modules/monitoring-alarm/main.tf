terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.77.0"
    }
  }
}

resource "oci_monitoring_alarm" "alarm" {
    #Required
    compartment_id          = var.compartment_id != "" ? var.compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
    destinations            = [var.notification_topic_id != "" ? var.notification_topic_id : lookup(data.oci_ons_notification_topics.get_topic.notification_topics[0], "topic_id")]
    display_name            = var.alarm_display_name
    is_enabled              = var.alarm_is_enabled
    metric_compartment_id   = var.compartment_id != "" ? var.compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
    namespace               = var.alarm_namespace
    query                   = var.alarm_query
    severity                = var.alarm_severity

    #Optional
    body                    = var.alarm_body
    message_format          = var.alarm_message_format
    pending_duration        = var.alarm_pending_duration
    //repeat_notification_duration = var.alarm_repeat_notification_duration

    freeform_tags = var.freeform_tags
}