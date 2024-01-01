resource "kubectl_manifest" "subscription" {
  yaml_body = <<YAML
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: ${var.operator.name}
  namespace: operators
spec:
  channel: ${var.operator.channel}
  name: ${var.operator.name}
  source: ${var.operator.source}
  sourceNamespace: ${var.operator.source_namespace}
  installPlanApproval: ${var.operator.install_plan_approval}
YAML
  wait      = true
  wait_for {
    field {
      key   = "status.state"
      value = "AtLatestKnown"
    }
    field {
      key   = "status.installedCSV"
      value = "^${var.operator.name}\\.v\\d+\\.\\d+\\.\\d+$"
      value_type = "regex"
    }
  }
}

