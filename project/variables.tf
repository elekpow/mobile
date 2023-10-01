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

variable "hostnames" {
  default = {
    "0" = "elvm"
#    "1" = "slave"
#    "2" = "slave2"
  }
}

variable "images" {
  type = map
  default = {
    "debian_10" = "fd8suc83g7bvp2o7edee"
    "debian_11" = "fd8il24jjf1hg8d4nq7i"
    "ubuntu_22" = "fd80bm0rh4rkepi5ksdi"
    "centos_7" = "fd8iqpj5nifue99bshhi"
  }
}

