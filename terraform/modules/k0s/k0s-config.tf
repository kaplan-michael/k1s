data "template_file" "k0s_config" {
  template = file("${path.module}/k0s-config.yaml.tpl")

  vars = {
    cluster_name = var.k0s.name
    cluster_sans = join(",", var.k0s.sans)
  }
}
