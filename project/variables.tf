variable "ssh_user" {
  type        = string
  default     = "igor"
}

variable "distr" {
  type = string
# debian 10
  default = "fd8u2e47jlq81vqvg87t"
# debian 11
  #default = "fd8vtq76jue50g6b6tm7"
# Ubuntu 22.04 LTS
  #default = "fd82nvvtllmimo92uoul"
# CentOS 7
  #default = "fd85qh2iveusn11jcup6"
# CentOS 8 Stream
  #default = "fd8a9hj9ki4msmk986ub"
###Joomla! 3.9.24
  #default = "fd8suepikkiatm3mlbds"  
}


variable "hostnames" {
  default = {
    "0" = "elvm"
   # "1" = "slave"
   # "2" = "slave2"
  }
}

