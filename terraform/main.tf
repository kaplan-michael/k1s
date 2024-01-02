module "cluster" {
  source = "./modules/k0s"
  k0s = var.k1s
}

module olm {
  source = "./modules/olm-kustomize"
  k0s_id = module.cluster.k0s_id
}

module ingress-nginx {
  source = "./modules/ingress"
  k0s_id = module.cluster.k0s_id
}

module metallb-operator {
  source = "./modules/operator"
  operator = {
    name = "metallb-operator"
    channel = "beta"
    source = "operatorhubio-catalog"
    source_namespace = "olm"
    install_plan_approval = "Automatic"
  }
  olm_version = module.olm.olm_version
}


module cert-manager-operator {
  source = "./modules/operator"
  operator = {
    name = "cert-manager"
    channel = "stable"
    source = "operatorhubio-catalog"
    source_namespace = "olm"
    install_plan_approval = "Automatic"
  }
  olm_version = module.olm.olm_version
}

module cloudnative-pg-operator {
  source = "./modules/operator"
  operator = {
    name = "cloudnative-pg"
    channel = "stable-v1"
    source = "operatorhubio-catalog"
    source_namespace = "olm"
    install_plan_approval = "Automatic"
  }
  olm_version = module.olm.olm_version
}

module custom-resources {
  source = "./modules/custom-resources"
  k0s_id = module.cluster.k0s_id
  depends_on = [
   module.cert-manager-operator,
   module.cloudnative-pg-operator,
   module.metallb-operator,
  ]
}