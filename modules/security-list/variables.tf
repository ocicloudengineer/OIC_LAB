
variable "compartment_id" {
  description = "Compartment ID"
}

variable "vcn_id" {
  description = "VCN ID"
}

variable "display_name" {
  description = "Nome de Exibição"
  type        = string
  default     = ""
}

variable "ingress_rules" {
  description = "Ingress Rule"
  type        = list(any)
  default     = []
}

variable "egress_rules" {
  description = "Egress Rule"
  type        = list(any)
  default     = []
}

variable "description" {
  type    = string
  default = ""
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
