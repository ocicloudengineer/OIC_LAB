variable "tenancy_ocid" {
  description = "OCID de tenancy"
  default     = "ocid1.tenancy.oc1..aaaaaaaaxpc3gqdb52h6uear7aujdhgpxwz4osbiprb3zv7ovj7t55yfgnia"
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
  default     = "ocid1.compartment.oc1..aaaaaaaazttlhlz2cwxyvaohrckpid6vyh2vjlxekwp7ggde5xis2s23ekda"  #Get after root lab compartment creation
}

variable "drg_compartment_prd_ocid" {
  default = "ocid1.compartment.oc1..aaaaaaaaphwwg73qdqeihou5vpdo4wqqcpaxwubyopb3ws7pmqga4axf3pea"
}

variable "drg_prd_ocid" {
  default = "ocid1.drg.oc1.iad.aaaaaaaaqapbwkvd42qrhur4miar23xparrs3meukffukphkocoyf4ladduq"
}