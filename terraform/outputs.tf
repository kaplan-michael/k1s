output "kubeconfig" {
  value = module.cluster.kubeconfig
  sensitive = true
  description = "k0s cluster kubeconfig"
}

output "cluster_name" {
  value = module.cluster.k0s_id
  description = "k0s cluster name"
}

output "host" {
  value = module.cluster.kube_host
  description = "k0s cluster host"
}