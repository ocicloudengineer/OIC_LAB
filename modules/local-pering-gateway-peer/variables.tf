# ------------------------------------------------------------------------------------------------------
# Required
# ------------------------------------------------------------------------------------------------------
variable "tenancy_ocid" {
}

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

variable "route_table_id" {
  type        = string
  default     = ""
  description = "Route Table ID"
}

variable "compartment_name_peer" {
  type        = string
  description = "Compartment Name"
}

variable "lpg_peer_name" {
  type        = string
  description = "Compartment Name"
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
