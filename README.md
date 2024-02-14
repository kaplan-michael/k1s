# K1s

## Disclaimer

**This is a work in progress and may not be ready for production use.
Use with caution and at your own risk.**

## Description

This project aims to set up and manage a k0s Kubernetes cluster on fedora CoreOS with batteries included.

**This includes the following:**
- A k0s cluster
- Cilium as the CNI
- OLM for managing operators
- Nginx Ingress Controller

**Coming soon (hopefully):**
- Some storage solution
- Some monitoring solution(probably prometheus stack)
- Some logging solution(probably Loki)
- Cilium Load Balancer and possibly ingress
- proper node update handling(once coreos has a proper mechanism to update from container images)
- proper node reboot handling(once kured supports coreos)

## Prerequisites

- Terraform
- Helm binary

## Installation

for installation of prerequisites, please refer to the official documentation of the respective projects.

## Usage

**Nodes:**
- Prepare nodes with Fedora CoreOS and 
- rebase them onto the os image `$ rpm-ostree rebase ostree-unverified-registry:quay.io/k1s-os/os:latest` (note: updates aren't automatic yet, so you will have to do this manually for now)

**Terraform:**
 - Refer to main.tf in the [example folder](./example).
 - Edit main.tf to suit your needs(mainly cluster details and node configs)
 - Run `terraform get` to download the module
 - Run `terraform init` to initialize terraform
 - Run `terraform plan` to see what will be created
 - Run `terraform apply` to create the cluster
 - Run `terraform output -raw kubeconfig >> kubeconfig.yaml` to get the kubeconfig

## Contributing

I will welcome contributions once it is in somewhat stable state!

## License

Mozilla Public License Version 2.0
[for more information, please refer to the LICENSE file.](LICENSE)

## Contact

Michael Kaplan - michael@kaplan.sh

## Acknowledgements

k0s project [GitHub](https://github.com/k0sproject) [website](https://k0sproject.io/)