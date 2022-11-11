terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.17"
    }
  }
}
## Password
resource "random_string" "db_system_password" {
  # Password must be 9 to 30 characters and contain at least 2 uppercase, 2 lowercase, 2 special, and 2 numeric characters. The special characters must be _, #, or -.
  length           = 16
  min_upper        = 2
  min_lower        = 2
  special          = true
  min_special      = 2
  override_special = "#_-"
  min_numeric      = 2
}

output "db_system_password" {
  value = random_string.db_system_password.result
}

#### DB SYSTEM ####
resource "oci_database_db_system" "db_system" {
  
  compartment_id      = var.compartment_ocid != "" ? var.compartment_ocid : lookup(data.oci_identity_compartments.get_compartment.compartments[0], "id")
  subnet_id           = lookup(data.oci_core_subnets.vcn_subnets.subnets[0], "id")
  availability_domain = var.availability_domain

  database_edition = var.database_edition

  hostname        = var.hostname
  #domain          = var.domain
  shape           = var.shape
  ssh_public_keys = var.ssh_public_key

  db_home {
    #Required
    database {
      #Required
      admin_password = var.admin_password != "" ? var.admin_password : random_string.db_system_password.result

      #Optional
      character_set = var.character_set
      ncharacter_set = var.ncharacter_set

      db_backup_config {
        #Optional
        auto_backup_enabled     = var.auto_backup_enabled
        recovery_window_in_days = var.recovery_window_in_days
      }

      db_name     = var.db_name
      db_workload = var.workload
    }

    #Optional
    display_name  = var.display_name
    db_version    = var.db_version

  }

  #Optional
  cluster_name              = var.cluster_name
  data_storage_size_in_gb   = var.storage_size_in_gb
  freeform_tags             = var.freeform_tags
  disk_redundancy           = var.disk_redundancy
  display_name              = var.display_name
  license_model             = var.license_model
  node_count                = var.node_count
  time_zone                 = var.time_zone
  nsg_ids                   = [data.oci_core_network_security_groups.nsg_result.network_security_groups[0].id]

}
