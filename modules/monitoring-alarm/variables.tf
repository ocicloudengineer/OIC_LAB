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

variable "alarm_display_name" {
  type        = string
  description = "alarm display name"
}

variable "alarm_is_enabled" {
  description = "alarm is enabled"
  default     = true
}

variable "alarm_namespace" {
  type        = string
  description = "alarm namespace"
}

variable "alarm_query" {
  type        = string
  description = "alarm query"
}

variable "alarm_severity" {
  type        = string
  description = "alarm severity"
}

variable "alarm_message_format" {
  description = "alarm message format"
  default     = "ONS_OPTIMIZED"
}

variable "alarm_pending_duration" {
  description = "alarm pending duration"
}

variable "alarm_body" {
  description = "alarm body"
  default = null
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
