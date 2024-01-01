data kustomization_overlay "ingress-nginx" {
  kustomize_options {
    enable_helm = true
    helm_path = "helm"
  }
  namespace = "ingress-nginx"
  helm_charts {
    name = "ingress-nginx"
    version = var.ingress-nginx-version
    repo = "https://kubernetes.github.io/ingress-nginx"
    release_name = "ingress-nginx"
    namespace = "ingress-nginx"
    values_inline = <<VALUES
      controller:
        kind: DaemonSet
        replicaCount: 1
        service:
          enabled: false
        ingressClassResource:
          name: nginx
          default: true
        hostPort:
          enabled: true
      serviceMonitor:
        enabled: false
    VALUES
  }
}

resource "kubectl_manifest" "nginx-ingress-ns" {
  yaml_body = <<YAML
apiVersion: v1
kind: Namespace
metadata:
  name: ingress-nginx
YAML
}

resource "kustomization_resource" "ingress-nginx" {
  for_each = { for v in data.kustomization_overlay.ingress-nginx.ids : v => v }
  manifest = data.kustomization_overlay.ingress-nginx.manifests[each.value]

}

