terraform {
  required_version = "~> 1.1.4"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.44"
    }
  }
}
resource "oci_containerengine_cluster" "main" {
  #Required
  compartment_id     = data.oci_identity_compartments.compartments.compartments[0].id
  kubernetes_version = var.cluster_kubernetes_version
  name               = var.cluster_name
  vcn_id             = data.oci_core_vcns.vcn.virtual_networks[0].id

  #Optional
  endpoint_config {

    #Optional
    subnet_id = data.oci_core_subnets.subnet_priv.subnets[0].id
  }
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = true
      is_tiller_enabled               = true
    }
    kubernetes_network_config {
      #Optional
      pods_cidr     = var.cluster_options_kubernetes_network_config_pods_cidr
      services_cidr = var.cluster_options_kubernetes_network_config_services_cidr
    }
    service_lb_subnet_ids = [data.oci_core_subnets.subnet.subnets[0].id]
  }
}

resource "local_file" "main" {
  content  = data.oci_containerengine_cluster_kube_config.main.content
  filename = var.kubeconfig_name
}

