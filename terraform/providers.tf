terraform {
  required_providers {
    k0sctl = {
      source = "mirantis/k0sctl"
      version = ">=0.0.2"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">=2.0"
    }
    olm = {
      source = "kaplan-michael/olm"
    }
    kubectl = {
      source = "alekc/kubectl"
      version = ">= 2.0.0"
    }
  }
}
provider "olm" {
    kubeconfig = module.cluster.kubeconfig
}

provider "kubectl" {
  host                   = module.cluster.kube_host
  cluster_ca_certificate = module.cluster.ca_cert
  client_certificate = module.cluster.client_cert
  client_key = module.cluster.client_key
  load_config_file       = false
}

provider "helm" {
  kubernetes {
    host     = module.cluster.kube_host
    client_certificate     = module.cluster.client_cert
    client_key             = module.cluster.client_key
    cluster_ca_certificate = module.cluster.ca_cert
  }
}