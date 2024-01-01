# K1s

## Disclaimer

**This is a work in progress and may not be ready for production use.
Use with caution and at your own risk.**

## Description

This project aims to set up and manage a k0s Kubernetes cluster on fedora CoreOS with dependency 
batteries included.

## Prerequisites

- Terraform
- Helm binary

## Installation

for installation of prerequisites, please refer to the official documentation of the respective projects.

## Usage

 - Refer to main.tf.example. 
 - Copy main.tf.example to main.tf
 - Edit main.tf to suit your needs(mainly cluster details and connection to the coreos box)
 - Run `terraform init`
 - Run `terraform apply`
 - Run `terraform apply`

## Contributing

I will welcome contributions once it is in somewhat stable state!

## License

Mozilla Public License Version 2.0
[for more information, please refer to the LICENSE file.](LICENSE)

## Contact

Michael Kaplan - michael@kaplan.sh

## Acknowledgements

k0s project [GitHub](https://github.com/k0sproject) [website](https://k0sproject.io/)