terraform {
  required_providers {
    kustomization = {
      source  = "kbst/kustomization"
      version = ">=0.9.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = ">= 2.0.0"
    }
  }
}
