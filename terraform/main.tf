module "cluster" {
  source = "./modules/k0s"
  k0s = var.k1s
  nodes = var.nodes
}

module "cilium" {
  source = "./modules/cilium"
  k0s_id = module.cluster.k0s_id
  kube_host = module.cluster.kube_host
  depends_on = [module.cluster]
}

module olm {
  source = "./modules/olm"
  depends_on = [module.cilium]
}

module ingress-nginx {
  source = "./modules/ingress"
  replicas = length(var.nodes)
  depends_on = [module.cilium]
}

module cert-manager {
  source = "./modules/cert-manager"
  depends_on = [module.olm]
}