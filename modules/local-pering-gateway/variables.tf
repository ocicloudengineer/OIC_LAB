# ------------------------------------------------------------------------------------------------------
# Required
# ------------------------------------------------------------------------------------------------------


variable "compartment_id" {
  type        = string
  description = "CompartmentID"
}

variable "vcn_id" {
  type        = string
  description = "VCN ID for a local Connection"
}

# ------------------------------------------------------------------------------------------------------
# Optional
# ------------------------------------------------------------------------------------------------------
variable "display_name" {
  type        = string
  default     = ""
  description = "Local Peering Gateway Display Name"
}

variable "peer_id" {
  type        = string
  default     = null
  description = "Peer ID"
}

variable "route_table_id" {
  type        = string
  default     = ""
  description = "Route Table ID"
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
