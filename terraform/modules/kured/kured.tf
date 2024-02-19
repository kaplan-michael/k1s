resource "helm_release" "cilium" {
  name       = "cilium"
  repository = "https://helm.cilium.io/"
  chart      = "cilium"
  namespace  = "kube-system"
  version    = var.cilium-version

  set {
    name  = "cluster.name"
    value = var.k0s_id
  }

  set {
    name = "k8sServiceHost"
    value = split(":", split("://", var.kube_host)[1])[0]
  }

  set {
    name = "k8sServicePort"
    value = "6443"
  }

  set {
    name = "kubeProxyReplacement"
    value = "strict"
  }

  set {
    name  = "operator.replicas"
    value = "1"
  }

  set {
    name = "routingMode"
    value = "tunnel"
  }

  set {
    name = "tunnelProtocol"
    value = "vxlan"
  }

  set {
    name = "serviceAccounts.cilium.name"
    value = "cilium"
  }

  set {
    name = "serviceAccounts.operator.name"
    value = "cilium-operator"
  }

  set {
    name = "hubble.relay.enabled"
    value = "true"
  }

    set {
        name = "hubble.ui.enabled"
        value = "true"
    }

  set {
    name = "l2announcements.enabled"
    value = "true"
  }

  set {
    name = "k8sClientRateLimit.qps"
    value = "50"
    }

  set {
    name = "k8sClientRateLimit.burst"
    value = "100"
    }
}

