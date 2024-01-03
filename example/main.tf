module "cluster" {
  source = "github.com/kaplan-michael/k1s"
  k1s = {
    name = "k0s-sno" #specify a name for the cluster
    version = "v1.28.4+k0s.0" #specify a version of k0s to install
    external_address = "api.k0s-sno.infra.int.kpml.net" #specify the external address of the cluster
    ssh = { #specify the ssh connection details to the cluster
      user     = "core"
      address = "0.0.0.0"
      port     = 22
      key_path = "*.ssh/id_ed25519"
    }
  }
}