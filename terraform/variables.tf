variable "k1s" {
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
  description = "Configuration for k1s"
  default     = {
    name    = "k1s"
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