variable "ingress-nginx-version"  {
  default = "4.9.0"
  type = string
  description = "version of nginx ingress to install(helm chart)"
}

variable "k0s_id" {
  type = string
  description = "cluster id"
}