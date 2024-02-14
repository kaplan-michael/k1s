module "cluster" {
  source = "github.com/kaplan-michael/k1s/terraform"
  k1s = {
    name = "k0s-sno" #specify a name for the cluster
    version = "v1.28.4+k0s.0" #specify a version of k0s to install
    sans = ["api.k0s-sno.infra.int.kpml.net"] #specify the external address of the cluster
  }
  nodes = [
    {
      role            = "controller+worker"
      hostname        = "some-node.somewhere.net"
      private_address = "nodeIP"
      no_taints       = true
      ssh = {
        address  = "nodeIP for ssh access"
        user     = "core"
        port     = 22
        key_path = "~/.ssh/id_ed25519"
      }
    },
  ]
}