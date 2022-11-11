variable "compartment_id" {
  description = "Compartment ID"
}

variable "vcn_id" {
  description = "VCN ID"
}

variable "drg_display_name" {
  description = "Nome de Exibição"
  default     = ""
}

variable "drg_attach_display_name" {
  description = "Nome de Exibição"
  default     = ""
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
variable "route_table_id" {
  description = "Route Table ID"
  default     = ""
}
