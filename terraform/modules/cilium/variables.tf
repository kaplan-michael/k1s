variable "cilium-version"  {
  default = "1.15.0"
  type = string
  description = "version of cilium chart to install"
}

variable "k0s_id" {
  type = string
  description = "ID of the k0s cluster"
}

variable "kube_host" {
  type = string
  description = "IP address of the k0s cluster"
}