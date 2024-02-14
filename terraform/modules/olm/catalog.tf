resource "kubectl_manifest" "olm_catalog_source" {
  yaml_body = <<YAML
apiVersion: operators.coreos.com/v1alpha1
kind: CatalogSource
metadata:
  name: operator-hub-catalog
  namespace: olm
spec:
  displayName: Operator Hub
  grpcPodConfig:
    priorityClassName: system-cluster-critical
    securityContextConfig: restricted
  image: quay.io/operatorhubio/catalog
  publisher: Operator Hub
  sourceType: grpc
  updateStrategy:
    registryPoll:
      interval: 10m
YAML
  depends_on = [olm_v0_instance.olm]
}