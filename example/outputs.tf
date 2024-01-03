output "kubeconfig" {
  value = module.cluster.kubeconfig
  sensitive = true
  description = "k0s cluster kubeconfig"
}