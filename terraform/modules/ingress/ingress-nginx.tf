resource "helm_release" "nginx-ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true
  version    = var.ingress-nginx-version

  set {
    name  = "controller.kind"
    value = "DaemonSet"
  }
  set {
      name  = "controller.replicaCount"
      value = var.replicas
  }
  set {
    name  = "controller.service.enabled"
    value = "false"
  }
  set {
    name  = "controller.ingressClassResource.name"
    value = "nginx"
  }
  set {
    name  = "controller.ingressClassResource.default"
    value = "true"
  }
  set {
    name  = "controller.hostPort.enabled"
    value = "true"
  }
  set {
    name  = "controller.allowSnippetAnnotations"
    value = "true"
  }
  set {
    name  = "serviceMonitor.enabled"
    value = "false"
  }
}