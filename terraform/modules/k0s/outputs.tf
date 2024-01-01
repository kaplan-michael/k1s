output "kubeconfig" {
  value = k0sctl_config.cluster.kube_yaml
  sensitive = true
  description = "k0s cluster kubeconfig"
}

output "k0s_id" {
  value = k0sctl_config.cluster.id
  description = "k0s cluster id"
}

output "ca_cert" {
  value       = k0sctl_config.cluster.ca_cert
  sensitive   = true
  description = "k0s cluster ca cert"

}
output "client_cert" {
  value = k0sctl_config.cluster.client_cert
  sensitive = true
  description = "k0s cluster client cert"
}

output "client_key" {
  value = k0sctl_config.cluster.private_key
  sensitive = true
  description = "k0s cluster client key"
}

output "kube_host" {
  value = k0sctl_config.cluster.kube_host
  sensitive = true
  description = "k0s cluster host"
}