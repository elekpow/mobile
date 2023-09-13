variable "ssh_key_private" {
  type        = string
  default     = "~/.ssh/id_ed25519"
}

variable "ssh_key_public" {
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "ssh_user" {
  type        = string
  default     = "igor"
}

variable "distr" {
  type = string
# debian"
  default = "fd8u2e47jlq81vqvg87t"
}


variable "hostnames" {
  default = {
    "0" = "elvm"
   # "1" = "slave"
   # "2" = "slave2"
  }
}

