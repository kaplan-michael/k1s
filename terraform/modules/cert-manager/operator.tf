resource "olm_v0_operator" "cert-manager" {
  name             = "cert-manager"
  channel          = "stable"
  namespace        = "operators"
  source           = "operator-hub-catalog"
  source_namespace = "olm"
}