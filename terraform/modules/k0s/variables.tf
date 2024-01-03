variable "k0s" {
  type = object({
    name    = string
    version = string
    external_address = string
    ssh     = object({
      address  = string
      user     = string
      port     = number
      key_path = string

    })
  })
  description = "Configuration for k0s"
  default     = {
    name    = "k0s"
    version = "v1.28.4+k0s.0"
    external_address = ""
    ssh     = {
      address  = ""
      user     = "core"
      port     = 22
      key_path = ""
    }
  }
}

variable "bastion" {
  type = object({
    address  = string
    user     = string
    port     = number
    key_path = string
  })
  description = "Configuration for bastion"
  default     = null
}