terraform {
  required_providers {
    k0sctl = {
      source = "mirantis/k0sctl"
      version = ">=0.0.2"
    }
    #kubernetes = {
    #  source = "hashicorp/kubernetes"
    #  version = ">=2.24"
    #}
    kustomization = {
      source = "kbst/kustomization"
      version = ">= 0.9.0"
    }
    kubectl = {
      source = "alekc/kubectl"
      version = ">= 2.0.0"
    }
  }
}
provider "k0sctl" {
  #no config needed
}

provider "kustomization" {
  kubeconfig_raw = module.cluster.kubeconfig
}

#hacky way to parse kubeconfig to get the details
locals {
  kube_config = yamldecode(module.cluster.kubeconfig)
}

#provider "kubernetes" {
#  host = local.kube_config.clusters[0].cluster.server
#  cluster_ca_certificate = base64decode(local.kube_config.clusters[0].cluster.certificate-authority-data)
#  client_certificate = base64decode(local.kube_config.users[0].user.client-certificate-data)
#  client_key = base64decode(local.kube_config.users[0].user.client-key-data)
#}


provider "kubectl" {
  host                   = local.kube_config.clusters[0].cluster.server
  cluster_ca_certificate = base64decode(local.kube_config.clusters[0].cluster.certificate-authority-data)
  client_certificate = base64decode(local.kube_config.users[0].user.client-certificate-data)
  client_key = base64decode(local.kube_config.users[0].user.client-key-data)
  load_config_file = false
}


#proper way to do it if we get the details from the module
#provider "kubernetes" {
#  host                   = module.cluster.kube_host
#  client_certificate     = module.cluster.client_cert
#  client_key             = module.cluster.client_key
#  cluster_ca_certificate = module.cluster.ca_cert
#}
