data kustomization_overlay "custom_resources" {
  resources = [
    "${path.module}/kustomization/clusterIssuer.yaml",
    "${path.module}/kustomization/issuer.yaml",
    "${path.module}/kustomization/metallb.yaml",
  ]
}

locals {
  manifest_ids = tolist(data.kustomization_overlay.custom_resources.ids)
}

resource "kustomization_resource" "custom_resources" {
  count = 3
  manifest = data.kustomization_overlay.custom_resources.manifests[local.manifest_ids[count.index]]
}