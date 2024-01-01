data "template_file" "k0s_config" {
  template = file("${path.module}/k0s-config.yaml.tpl")

  vars = {
    cluster_name = var.k0s.name
    cluster_external_address = var.k0s.external_address
  }
}
