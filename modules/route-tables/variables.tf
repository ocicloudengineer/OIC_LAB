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

variable "subnet_attach" {
  type        = number
  default     = 1
  description = "Qtd de Attach de Subnets"
}

variable "display_name" {
  description = "Descrição dos Recursos"
  default     = ""
  type        = string
}

variable "route_rules" {
  description = "Regras de Roteamento"
  default     = [{ network_entity_id = "", destination = "", destination_type = null }]
  type        = list(any)
}

variable "service_id" {
  default = ""
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
