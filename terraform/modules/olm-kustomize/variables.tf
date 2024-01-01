variable "olm-version"  {
  default = "v0.26.0"
  type = string
  description = "version of OLM to install !only V0 !"
}

variable "olm-base-url" {
    default = "https://github.com/operator-framework/operator-lifecycle-manager/releases/download"
    type = string
    description = "base url of OLM to install !only V0 !"
}

variable "k0s_id" {
  type = string
  description = "cluster id"
}