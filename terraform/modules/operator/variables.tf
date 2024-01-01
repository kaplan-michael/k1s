variable "operator" {
  type = object({
    name      = string
    channel   = string
    install_plan_approval = string
    source    = string
    source_namespace = string

  })
}

variable "olm_version" {
  type = string
  description = "olm version installed on the cluster"
}