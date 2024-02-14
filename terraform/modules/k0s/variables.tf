variable "k0s" {
  type = object({
    name    = string
    version = string
    sans = list(string)
  })
  description = "Configuration for k0s"
  default     = {
    name    = "k0s"
    version = "v1.28.4+k0s.0"
    sans = []
  }
}

variable "nodes" {
  description = "List of node objects for host configuration, including SSH details"
  type = list(object({
    role            = string
    hostname        = string
    private_address = string
    no_taints       = bool
    ssh = object({
      address  = string
      user     = string
      port     = number
      key_path = string
    })
  }))
}

