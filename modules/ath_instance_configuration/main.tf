variable display_name {}

resource "oci_core_instance_configuration" "TFInstanceConfiguration" {
  compartment_id = lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
  display_name   = var.display_name

  instance_details {
    instance_type = "compute"

    launch_details {
      compartment_id = lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
      ipxe_script    = "ipxeScript"
      shape          = "VM.Standard2.2"
      display_name   = "TFExampleInstanceConfigurationLaunchDetails"

      create_vnic_details {
        assign_public_ip       = true
        display_name           = "TFExampleInstanceConfigurationVNIC"
        skip_source_dest_check = false
      }

      extended_metadata = {
        some_string   = "stringA"
        nested_object = "{\"some_string\": \"stringB\", \"object\": {\"some_string\": \"stringC\"}}"
      }

      source_details {
        source_type = "image"
        image_id    = "ocid1.image.oc1.iad.aaaaaaaajwdfxazvlzquexvxwkiatm66jqxqq6izla6kiiowgvvdtn2zyv3a"
      }
    }
  }
}

/*
resource oci_core_instance_configuration oci_core_instance_configuration_res {
  compartment_id = lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
  display_name   = var.display_name
  instance_details {
    block_volumes {
      attach_details {
        device       = var.instance_config_template_onoff.instance_details.block_volumes.attach_details.device
        display_name = "${var.display_name}"
        is_read_only = var.instance_config_template_onoff.instance_details.block_volumes.attach_details.is_read_only
        is_shareable = var.instance_config_template_onoff.instance_details.block_volumes.attach_details.is_shareable
        type         = var.instance_config_template_onoff.instance_details.block_volumes.attach_details.type
      }
      create_details {
        compartment_id = lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
        display_name   = var.display_name
      }
    }
    instance_type = var.instance_config_template_onoff.instance_details.instance_type
    launch_details {
      agent_config {
        is_management_disabled = "false"
        is_monitoring_disabled = "false"
      }
      availability_config {
        recovery_action = "RESTORE_INSTANCE"
      }
      compartment_id = lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
      create_vnic_details {
        assign_public_ip = "false"
        display_name     = var.display_name
        nsg_ids = [
        ]
        skip_source_dest_check = "false"
      }
      display_name = var.display_name
      instance_options {
        are_legacy_imds_endpoints_disabled = "false"
      }
      is_pv_encryption_in_transit_enabled = "false"
      launch_mode                         = "NATIVE"
      launch_options {
        boot_volume_type        = ""
        firmware                = ""
        network_type            = "PARAVIRTUALIZED"
        remote_data_volume_type = ""
      }
      metadata = {
        "ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAxwht/raG98qIlN5pOxN/jX/6SEP5IjSNQB2vXGFx8aok7boj6OyITNe9tV+mybnPE8GdFYY9huDUCIiXzQqLNak2prXh5FM7BArCfOV7h6Y0dlCOfsZcylNBYE10ez7pvgoVVnEUxLELaVIoYulhX5XR14mYI7WAwDTpvarNPFNL0LadEJk5JVyWTzNS+jVDN/URVG8rwjk2FQsc66kpv+NeCo88+nIXuDkEULx4a6qxYgP4KlrbL3h8/ejPKz24xl3aC5LEMg8ht+ak40NEM0CaNOZOF1AXwgTUQByVYqDOQvAoe+2ykYYcXWCW8wRR78nbwqKZOvbeVqq9RXlTMw== rsa-key-20200730"
        "user_data"           = "IyEvYmluL2Jhc2gKc3lzdGVtY3RsIHN0YXJ0IG9jaWQuc2VydmljZQpzeXN0ZW1jdGwgZW5hYmxlIG9jaWQuc2VydmljZQoKdmcxPURhdGFfQWdlbnRfT0lDX3ZnCmx2MT1EYXRhX0FnZW50X09JQ19sdgptcDE9L0RhdGFfQWdlbnRfT0lDCmRldjE9Ii9kZXYvc2RiIgoKd2hpbGUgOgpkbwppZiBbIC1lICIkZGV2MSIgXTsgdGhlbgogICAgICAKICAgICAgICBta2RpciAtcCAkbXAxCiAgICAgICAgcHZjcmVhdGUgICRkZXYxCiAgICAgICAgdmdjcmVhdGUgJHZnMSAkZGV2MQogICAgICAgIGx2Y3JlYXRlIC1sIDEwMCVGUkVFIC1uICRsdjEgJHZnMQogICAgICAgIG1rZnMuZXh0NCAvZGV2LyR2ZzEvJGx2MQogICAgICAgIGVjaG8gIlVVSUQ9JChibGtpZCAtbyB2YWx1ZSAtcyBVVUlEIC9kZXYvJHZnMS8kbHYxKSAgICAkbXAxICAgIGV4dDQgICBkZWZhdWx0cyxfbmV0ZGV2ICAgMCAgIDAiID4+IC9ldGMvZnN0YWIKICAgICAgICBtb3VudCAtYQogICAgICAgIGJyZWFrCmZpCmRvbmUK"
      }
      preferred_maintenance_action = ""
      shape                        = "VM.Standard2.2"
      source_details {
        boot_volume_size_in_gbs = "80"
        image_id                = "ocid1.image.oc1.iad.aaaaaaaajwdfxazvlzquexvxwkiatm66jqxqq6izla6kiiowgvvdtn2zyv3a"
        source_type             = "image"
      }
    }
  }
}

*/