variable "ingress-nginx-version"  {
  default = "4.9.0"
  type = string
  description = "version of nginx ingress to install(helm chart)"
}

variable "replicas" {
  default = 1
  type = number
  description = "number of replicas for the ingress controller"
}
