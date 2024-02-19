data "template_file" "k0s_config" {
  template = file("${path.module}/k0s-config.yaml.tpl")

  vars = {
    cluster_name = var.k0s.name
    cluster_sans = length(var.k0s.sans) > 0 ? join(",", var.k0s.sans) : ""
    external_address = var.k0s.external_address != null ? var.k0s.external_address : ""
  }
}
