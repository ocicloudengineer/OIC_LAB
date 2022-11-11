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

variable "notification_topic_name" {
  type        = string
  description = "notification topic name"
}

variable "notification_topic_description" {
  type        = string
  description = "notification topic description"
  default     = ""
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
