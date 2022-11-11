variable "tenancy_ocid" {
}

variable "compartment_name" {
  type        = string
  description = "Compartment Name"
}

variable "cluster_kubernetes_version" {
  type        = string
  description = "The version of Kubernetes to install into the cluster masters"
}

variable "node_pool_shape" {
  type        = string
  description = "The name of the node shape of the nodes in the node pool"
}

variable "flex_shape_ocpus" {
  type        = string
  description = "The number of ocpus for the nodes in the node pool"
  default     = null
}
variable "flex_shape_memory" {
  type        = string
  description = "The amount of memory for the nodes in the node pool"
  default     = null
}

variable "ssh_public_key" {
  type        = string
  description = "The SSH public key on each node in the node pool on launch"
}

variable "node_pool_name" {
  type        = string
  description = "The name of the node pool"
}

variable "node_pool_image_id" {
  type        = string
  description = "The OCID of the image used to boot the node"
}

variable "quantity_nodes" {
  type        = string
  description = "The number of nodes to create in each subnet specified in subnetIds property"
}

variable "node_pool_worker_subnet_name" {
  type        = string
  description = "The availability domain in which to place nodes"
}

variable "node_pool_availability_domain_1" {
  type        = string
  description = "The availability domain in which to place nodes"
}

variable "node_pool_availability_domain_2" {
  type        = string
  description = "The availability domain in which to place nodes"
}

variable "node_pool_availability_domain_3" {
  type        = string
  description = "The availability domain in which to place nodes"
}

/*
variable "node_pool_availability_domain_1_subnet_id" {
  type        = string
  description = "The subnet id of availability domain 1 which to place nodes"
}

variable "node_pool_availability_domain_2_subnet_id" {
  type        = string
  description = "The subnet id of availability domain 2 which to place nodes"
}

variable "node_pool_availability_domain_3_subnet_id" {
  type        = string
  description = "The subnet id of availability domain 3 which to place nodes"
}
*/
variable "cluster_name" {
  type        = string
  description = "The cluster OCID that will place nodes"
}

variable "freeform_tags" {
  type        = map(any)
  default     = {}
  description = "Free-form tags for this resource."
}
