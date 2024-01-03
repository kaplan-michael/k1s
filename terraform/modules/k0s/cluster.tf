resource "k0sctl_config" "cluster" {
  metadata {
    name = var.k0s.name
  }
  spec {
    host {
      role = "controller+worker"
      #hostname = ""
      #private_address = ""

      ssh { # Nested block for SSH configuration
        address = var.k0s.ssh.address
        user = var.k0s.ssh.user
        port = var.k0s.ssh.port
        key_path = var.k0s.ssh.key_path
        dynamic "bastion" {
          for_each = var.bastion != null ? [var.bastion] : []
          content {
            address  = bastion.value.address
            user     = bastion.value.user
            port     = bastion.value.port
            key_path = bastion.value.key_path
          }
        }
      }

      install_flags = [
        "--profile coreos",
        "--cri-socket remote:unix:///var/run/crio/crio.sock",
        "--no-taints"
      ]
    }
    k0s {
      version = var.k0s.version
      config = data.template_file.k0s_config.rendered
    }
  }
}


