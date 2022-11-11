terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.44"
    }
  }
}

resource "oci_containerengine_node_pool" "main" {
  #Required
  cluster_id         = data.oci_containerengine_clusters.oke_cluster.clusters[0].id
  compartment_id     = data.oci_identity_compartments.compartments.compartments[0].id
  kubernetes_version = var.cluster_kubernetes_version
  name               = var.node_pool_name
  node_shape         = var.node_pool_shape
  node_shape_config {
    #Optional
    memory_in_gbs = var.flex_shape_memory
    ocpus = var.flex_shape_ocpus
  }
  ssh_public_key     = var.ssh_public_key
  node_config_details {
    placement_configs {
      availability_domain = var.node_pool_availability_domain_1
      subnet_id           = data.oci_core_subnets.subnets_worker.subnets[0].id
    }

    placement_configs {
      availability_domain = var.node_pool_availability_domain_2
      subnet_id           = data.oci_core_subnets.subnets_worker.subnets[0].id
    }

    placement_configs {
      availability_domain = var.node_pool_availability_domain_3
      subnet_id           = data.oci_core_subnets.subnets_worker.subnets[0].id
    }
    size = var.quantity_nodes
  }
  node_source_details {
    image_id    = var.node_pool_image_id
    source_type = "IMAGE"
  }
}
