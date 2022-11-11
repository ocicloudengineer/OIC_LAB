## Copyright (c) 2021 Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {
}

variable "compartment_name" {
  type        = string
  description = "Compartment Name"
}

variable "subnet_display_name" {
  type        = string
  description = "Subnet Name"
}

variable "network_compartment" {
  type        = string
  description = "network compartment name"
}

variable "compartment_id" {
  type        = string
  description = "Compartment Id"
  default     = ""
}

variable "vcn_compartment_id" {
  description = "ID do compartment, usar ou o vcn_compartment_id ou o vcn_compartment_name"
  default     = ""
}

variable "subnet_id" {
  description = "Subnet ID"
  default     = ""
}

variable "customer_contacts_email" {
  description = "Contact email for administrative and maintenance matters"
  default     = null
}

variable "customer_contacts_email_list" {
  description = "Contact email for administrative and maintenance matters list"
  default     = []
}

variable "adb_password" {}

variable "use_existing_vcn" {
  default = true
}

variable "vcn_cidr" {
  default = "10.0.0.0/16"
}

variable "vcn_id" {
  default = ""
}

variable "vcn_name" {
  description = "O nome da VCN da instancia, use o vcn_id ou o vcn_name"
  default     = ""
}

variable "adb_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "adb_subnet_id" {
  default = ""
}

variable "adb_nsg_id" {
  default = ""
}

variable "nsg_name" {
  type        = string
  default     = ""
  description = "nombre del nsg"

}

variable "adb_free_tier" {
  default = false
}

variable "adb_private_endpoint" {
  default = true
}

variable "adb_database_cpu_core_count" {
  default = 1
}

variable "adb_database_data_storage_size_in_tbs" {
  default = 1
}

variable "adb_database_db_name" {
  default = ""
}

variable "adb_database_db_version" {
  default = "19c"
}

variable "adb_database_db_workload" {
  default = "OLTP"
}

variable "adb_data_safe_status" {
  default = "NOT_REGISTERED"
}

variable "adb_database_defined_tags_value" {
  default = ""
}

variable "adb_database_display_name" {
  default = "ADB"
}

variable "adb_database_freeform_tags" {
  default = {
    "Owner" = "ADB"
  }
}

variable "adb_database_license_model" {
  default = "LICENSE_INCLUDED"
}

variable "adb_database_edition" {
  default = "ENTERPRISE_EDITION"
}

variable "adb_tde_wallet_zip_file" {
  default = "tde_wallet_adb1.zip"
}

variable "adb_private_endpoint_label" {
  default = "adbprivendpoint"
}

variable "whitelisted_ips" {
  default = [""]
}

variable "is_data_guard_enabled" {
  default = false
}

variable "is_auto_scaling_enabled" {
  default = false
}

variable "is_auto_scaling_for_storage_enabled" {
  default = false
}

variable "adb_wallet_password_specials" {
  default = true
}

variable "adb_wallet_password_length" {
  default = 16
}

variable "adb_wallet_password_min_numeric" {
  default = 2
}

variable "adb_wallet_password_override_special" {
  default = ""
}

variable "defined_tags" {
  default = {}
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}