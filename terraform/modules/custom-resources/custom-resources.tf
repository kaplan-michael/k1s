data kustomization_overlay "custom_resources" {
  resources = [
    "${path.module}/kustomization/clusterIssuer.yaml",
    "${path.module}/kustomization/issuer.yaml",
    "${path.module}/kustomization/metallb.yaml",
  ]
}

resource "kustomization_resource" "custom_resources" {
  for_each = { for v in data.kustomization_overlay.custom_resources.ids : v => v }
  manifest = data.kustomization_overlay.custom_resources.manifests[each.value]

}