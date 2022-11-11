variable "tenancy_ocid" {
}

variable "compartment_name" {
  type        = string
  description = "Compartment Name"
}

variable "subnet_display_name" {
  type        = string
  description = "Subnet Name"
}

variable "subnet_display_name_priv" {
  type        = string
  description = "Subnet Name"
}

variable "cluster_kubernetes_version" {
  type        = string
  description = "The version of Kubernetes to install into the cluster masters"
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
}

variable "cluster_options_kubernetes_network_config_pods_cidr" {
  type        = string
  description = "The CIDR block for Kubernetes pods."
}

variable "cluster_options_kubernetes_network_config_services_cidr" {
  type        = string
  description = "The CIDR block for Kubernetes services"
}

variable "kubeconfig_name" {
  type        = string
  description = "The name of kubconfig file generates"
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
