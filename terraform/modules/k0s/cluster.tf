resource "k0sctl_config" "cluster" {
  metadata {
    name = var.k0s.name
  }
  no_wait = true
  spec {
    dynamic "host" {
      for_each = var.nodes

      content {
        role            = host.value.role
        hostname        = host.value.hostname
        private_address = host.value.private_address
        no_taints       = host.value.no_taints

        ssh {
          address  = host.value.ssh.address
          user     = host.value.ssh.user
          port     = host.value.ssh.port
          key_path = host.value.ssh.key_path
        }

        install_flags = [
          "--profile coreos",
          "--cri-socket remote:unix:///var/run/crio/crio.sock",
          "--taints node.cilium.io/agent-not-ready=true:NoExecute",
        ]
      }
    }

    k0s {
      version = var.k0s.version
      config = data.template_file.k0s_config.rendered
    }
  }
}


