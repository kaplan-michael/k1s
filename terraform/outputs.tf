output "kubeconfig" {
  value = module.cluster.kubeconfig
  sensitive = true
  description = "k0s cluster kubeconfig"
}

output "cluster_name" {
  value = module.cluster.k0s_id
  description = "k0s cluster name"
}

output "ca_cert" {
  value       = module.cluster.ca_cert
  sensitive   = true
  description = "k0s cluster ca cert"

}
output "client_cert" {
  value = module.cluster.client_cert
  sensitive = true
  description = "k0s cluster client cert"
}

output "client_key" {
  value = module.cluster.client_key
  sensitive = true
  description = "k0s cluster client key"
}

output "kube_host" {
  value = module.cluster.kube_host
  sensitive = true
  description = "k0s cluster host"
}

output "k0s_yaml" {
  value = module.cluster.k0s_yaml
  description = "k0s debug yaml"
}