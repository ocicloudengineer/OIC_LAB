variable "tenancy_ocid" {
  description = "OCID do tenancy"
}

variable "compartment_name" {
  description = "Compartment name"
}

variable "bucket_name" {
  description = "Bucket name"
}

variable "bucket_access_type" {
  description = "Type of access for the bucket"
  default = "NoPublicAccess"
}

variable "bucket_auto_tiering" {
  description = "Set the auto tiering status on the bucket"
  default = "Disabled"
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}

variable "kms_key" {
  default = ""
}

variable "bucket_storage_tier" {
  description = "Set the storage tier on the bucket"
  default = "Standard"
}

variable "bucket_versioning" {
  description = "Set if the bucket has versioning enabled"
  default = "Disabled"
}

