variable "compartment_id" {
  description = "Compartment ID do Recurso"
}

variable "vcn_id" {
  description = "VCN ID do recurso"
}

variable "enabled" {
  description = "Se o Internet Gateway ficara habilitado apos a criação"
  default     = true
}

variable "display_name" {
  description = "Display Name do Recurso"
  default     = ""
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
