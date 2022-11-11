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
  default     = ""
}

variable "notification_topic_id" {
  type        = string
  description = "notification_topic_id"
  default     = ""
}

variable "subscription_protocol" {
  type        = string
  description = "subscription protocol"
  default     = "EMAIL"
}

variable "subscription_endpoint" {
  type        = string
  description = "subscription endpoint"
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
