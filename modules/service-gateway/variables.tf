variable "compartment_id" {
  description = "Compartment ID"
}

variable "vcn_id" {
  description = "VCN ID"
}

variable "subnet_id" {
  description = "Subnet ID para Attach da Regra de Roteamento"
  default     = ""
}

variable "display_name" {
  description = "Descrição dos Recursos"
  default     = ""
  type        = string
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
