variable "display_name" {
  type = string
}

variable "compartment_name" {
  type = string
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
variable "compartment_src_name" {
  type = string
}
