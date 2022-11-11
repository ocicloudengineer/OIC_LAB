variable "tenancy_ocid" {
}

variable "compartment_id" {
  type        = string
  description = "Compartment Id"
  default     = ""
}

variable "compartment_name" {
  type        = string
  description = "Compartment Name"
}

variable "display_name" {
  type = string
}

variable "vault_type" {
}

variable "key_shape_algorithm" {
  description = "The algorithm used by a key's key versions to encrypt or decrypt."
}

variable "key_shape_length" {
  description = "The length of the key, expressed as an integer. Values of 16, 24, or 32 are supported."
}

variable "protection_mode" {
  description = "The key's protection mode indicates how the key persists and where cryptographic operations that use the key are performed."
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
