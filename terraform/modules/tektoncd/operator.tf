resource "olm_v0_operator" "tektoncd_operator" {
  name             = "tektoncd-operator"
  channel          = "alpha"
  namespace        = "operators"
  source           = "operator-hub-catalog"
  source_namespace = "olm"
}