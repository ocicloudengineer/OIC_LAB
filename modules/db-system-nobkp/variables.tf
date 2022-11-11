variable "tenancy_ocid" {
}

variable "db_version" {
}

variable "compartment_name" {
  type        = string
  description = "Compartment Name"
}

variable "subnet_display_name" {
  type        = string
  description = "Subnet Name"
}

variable "vcn_compartment_id" {
  default = ""
}

variable "vcn_id" {
  default = ""
}

variable "compartment_ocid" {
  default = ""
}

variable "admin_password" {
  default = ""
}

variable "network_compartment" {
  default = ""
}

variable "vcn_name" {
  default = ""
}

variable "nsg_name" {
  type        = string
  default     = ""
  description = "nombre del nsg"

}

variable "ssh_public_key" {
  type = list(string)
}

variable "display_name" {
}

variable "hostname" {
}

variable "db_name" {
  description = "It must begin with an alphabetic character and can contain a maximum of eight alphanumeric characters. Special characters are not permitted."
}

variable "license_model" {
  description = "LICENSE_INCLUDED ou BRING_YOUR_OWN_LICENSE"
  default     = "BRING_YOUR_OWN_LICENSE"
}

variable "shape" {
  default = "VM.Standard2.1"
}

variable "database_edition" {
  description = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE ou ENTERPRISE_EDITION"
  default     = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
}

variable "character_set" {
  default = "AL32UTF8"
}

variable "ncharacter_set" {
  default = "AL16UTF16"
}

variable "auto_backup_enabled" {
  default = true
}

variable "recovery_window_in_days" {
  default = 30
}

variable "node_count" {
  default = "1"
}

variable "cluster_name" {
  default = ""
}

variable "disk_redundancy" {
  default = "HIGH"
}

variable "workload" {
  default = "OLTP"
}

variable "storage_size_in_gb" {
  default = "256"
}

variable "time_zone" {
  default = "UTC"
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
variable "availability_domain" {
}
