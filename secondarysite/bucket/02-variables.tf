variable "tenancy_ocid" {
  description = "OCID de tenancy"
  default     = "ocid1.tenancy.oc1..aaaaaaaa6pe4hloqyznt2fqrhkxzgzcoav2gapapstvwrxbhsij5ne4f2shq"
}

variable "region" {
  default = "us-phoenix-1"
}

variable "environment" {
  default = "OIC"
}

variable "ambiente" {
  default = "PRD"
}

variable "proyecto" {
  default = "LABDRINTEGRATION"
}

variable "parent_lab_dr_compartment_ocid" {
  description = "OCID de compartment para el Laboratorio"
  default     = "ocid1.compartment.oc1..aaaaaaaatwhzwxo5zzj6cr6yliputc6sv22hibtfl6yg4g3tgo3ycpcin5ya"  #Get after root lab compartment creation
}

variable "bucket_access_type" {
  default = "NoPublicAccess"
}

variable "bucket_auto_tiering" {
  default = "Disabled"
}

variable "bucket_storage_tier" {
  default = "Standard"
}

variable "bucket_versioning" {
  default = "Enabled"
}