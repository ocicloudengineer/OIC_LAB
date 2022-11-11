variable "tenancy_ocid" {
}

variable "file_system_id" {
  type        = string
  description = "FileSystem Id"
  default     = ""
}

variable "mount_target_id" {
  type        = string
  description = "Mount Target Id"
  default     = ""
}

variable "compartment_id" {
  type        = string
  description = "Compartment Id"
  default     = ""
}

variable "availability_domain" {
  type        = string
  description = "Availability Domain"
}

variable "compartment_name" {
  type        = string
  description = "Compartment Name"
}

variable "display_name" {
  type        = string
  description = "CIDR Block"
}

variable "display_name_mt" {
  type        = string
  description = "Mount Target Name"
}

variable "display_name_fss" {
  type        = string
  description = "File System Name"
}

variable "path" {
  type = string
}

variable "access" {
  type    = string
  default = "READ_WRITE"
}

variable "source_export_1" {
  type    = string
  default = ""
}

variable "source_export_2" {
  type    = string
  default = ""
}

variable "source_export_3" {
  type    = string
  default = ""
}

variable "source_export_4" {
  type    = string
  default = ""
}

variable "identity_squash" {
  type    = string
  default = "NONE"
}

variable "require_privileged_source_port" {
  type    = string
  default = false
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}

variable "common_tags_values" {
  type = map(any)
  default = {
    "Environment"  = ""
    "Owner"        = ""
    "Creator"      = ""
    "Label"        = ""
    "SO"           = ""
    "Project"      = ""
    "Organization" = ""
    "Service"      = ""
    "CostCenter"   = ""
    "IDContabil"   = ""
    "Namespace"    = "REQUIRED"
  }
  description = "Defined tags for this resource."
}

