resource "kubectl_manifest" "selfsigned_cluster_issuer" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
    name: selfsigned-issuer
spec:
  selfSigned: {}
YAML
  depends_on = [olm_v0_operator.cert-manager]
}