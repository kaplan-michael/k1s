data kustomization_overlay "olm" {
  resources = [
    format("%s/%s/crds.yaml", var.olm-base-url, var.olm-version),
    format("%s/%s/olm.yaml", var.olm-base-url, var.olm-version)
  ]
}

resource "kustomization_resource" "olm" {
  for_each = { for v in data.kustomization_overlay.olm.ids : v => v }
  manifest = data.kustomization_overlay.olm.manifests[each.value]

}
