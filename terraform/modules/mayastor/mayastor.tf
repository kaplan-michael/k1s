resource "helm_release" "mayastor" {
  name       = "mayastor"
  repository = "https://openebs.github.io/mayastor-extensions"
  chart      = "mayastor"
  namespace  = "mayastor"
  create_namespace = true
  version    = var.mayastor-version

  set {
    name  = "csi.node.kubeletDir"
    value = "/var/lib/k0s/kubelet"
  }

  set {
    name  = "loki-stack.enabled"
    value = "false"
  }
}

