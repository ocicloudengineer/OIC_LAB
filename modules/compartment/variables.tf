variable "compartment_id" {
  type    = string
  default = ""
}

variable "compartment_name" {
  type    = string
  default = ""
}

variable "compartment_description" {
  type    = string
  default = ""
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
}
