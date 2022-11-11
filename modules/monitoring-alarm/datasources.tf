data "oci_identity_compartments" "get_compartment" {
  compartment_id            = var.tenancy_ocid
  access_level              = "ANY"
  compartment_id_in_subtree = true

  filter {
    name   = "state"
    values = ["ACTIVE"]
  }

  filter {
    name   = "name"
    values = [var.compartment_name]
  }
}

data "oci_ons_notification_topics" "get_topic" {
  compartment_id    = data.oci_identity_compartments.get_compartment.compartments.0.id
  name              = var.notification_topic_name
}