terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.17"
    }
  }
}
locals {
  common_tags_values = zipmap(
    formatlist(
      "%s.%s",
      var.common_tags_values["Namespace"],
      keys(var.common_tags_values),
    ),
    values(var.common_tags_values),
  )
}


resource "oci_file_storage_export_set" "test_export_set" {
  #Required
  #mount_target_id = data.oci_file_storage_mount_targets.mount_target.mount_targets[0].id
  mount_target_id = var.mount_target_id
  #Optional
  display_name      = var.display_name
  max_fs_stat_bytes = 23843202333
  max_fs_stat_files = 223442
}

resource "oci_file_storage_export" "test_export" {
  #Required
  export_set_id = oci_file_storage_export_set.test_export_set.id
  # file_system_id = data.oci_file_storage_file_systems.file_system.file_systems[0].id
  file_system_id = var.file_system_id
  path           = var.path

  #Optional
  export_options {
    source = var.source_export_1

    #Optional
    access                         = var.access
    identity_squash                = var.identity_squash
    require_privileged_source_port = var.require_privileged_source_port
  }

}
