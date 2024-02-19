resource "helm_release" "kured" {
  name       = "kured"
  repository = "https://kubereboot.github.io/charts"
  chart      = "kured"
  namespace  = "kube-system"
  version    = var.kured-version
}

