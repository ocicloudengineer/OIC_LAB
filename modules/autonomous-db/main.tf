## Copyright (c) 2021 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.77.0"
    }
  }
}

locals {
  email_list = { for email in var.customer_contacts_email_list : email => "" } # EMAILS
}

## Password
resource "random_string" "adb_admin_password" {
  # Password must be 9 to 30 characters and contain at least 2 uppercase, 2 lowercase, 2 special, and 2 numeric characters. The special characters must be _, #, or -.
  length           = 16
  min_upper        = 2
  min_lower        = 2
  special          = true
  min_special      = 2
  override_special = "#_-"
  min_numeric      = 2
}

output "adb_admin_password" {
  value = random_string.adb_admin_password.result
}

resource "oci_database_autonomous_database" "adb_database" {
  #admin_password                            = var.adb_password
  admin_password                            = var.adb_password != "" ? var.adb_password : random_string.adb_admin_password.result
  #compartment_id                            = var.compartment_id != "" ? var.compartment_id : data.oci_identity_compartments.get_compartment.compartments[0]["id"]
  compartment_id                            = var.compartment_id != "" ? var.compartment_id : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
  #subnet_id                                 = data.oci_core_subnets.subnet.subnets[0].id
  subnet_id                                 = var.subnet_id == "" ? lookup(data.oci_core_subnets.vcn_subnets.subnets[0], "id") : var.subnet_id
  cpu_core_count                            = var.adb_database_cpu_core_count
  data_storage_size_in_tbs                  = var.adb_database_data_storage_size_in_tbs
  db_name                                   = var.adb_database_db_name
  db_version                                = var.adb_database_db_version
  data_safe_status                          = var.adb_data_safe_status
  db_workload                               = var.adb_database_db_workload
  display_name                              = var.adb_database_display_name
  license_model                             = var.adb_database_license_model
  database_edition                          = var.adb_database_edition
  is_free_tier                              = var.adb_free_tier
  is_data_guard_enabled                     = var.is_data_guard_enabled
  is_auto_scaling_enabled                   = var.is_auto_scaling_enabled
  is_auto_scaling_for_storage_enabled       = var.is_auto_scaling_for_storage_enabled
  whitelisted_ips                           = var.adb_private_endpoint ? null : var.whitelisted_ips
  #nsg_ids                                   = var.adb_private_endpoint ? [local.adb_nsg_id] : null
  nsg_ids                                   = [data.oci_core_network_security_groups.nsg_result.network_security_groups[0].id]
  private_endpoint_label                    = var.adb_private_endpoint ? var.adb_private_endpoint_label : null
  freeform_tags                             = var.freeform_tags
  dynamic "customer_contacts" {
    for_each = local.email_list
    content {
      email = customer_contacts.key
    }
  }
}
/*
resource "random_password" "wallet_password" {
  length           = var.adb_wallet_password_length
  special          = var.adb_wallet_password_specials
  min_numeric      = var.adb_wallet_password_min_numeric
  override_special = var.adb_wallet_password_override_special
}

resource "oci_database_autonomous_database_wallet" "adb_database_wallet" {
  autonomous_database_id = oci_database_autonomous_database.adb_database.id
  password               = random_password.wallet_password.result
  base64_encode_content  = "true"
}
*/