resource "yandex_compute_instance" "elvm" {
  name = "${var.name_ids[count.index]}"
  platform_id = "${var.platform["v3"]}"
  zone        = "${var.zone_data["zone_a"]}"
  hostname = "${var.name_ids[count.index]}"
  
 count = 2
#  count  = length(var.subnet_ids)
  resources {
    core_fraction = 20
    cores  = 2
    memory = 2
  }
  
  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = "${var.images["debian_10"]}"
      type = "network-ssd"
      size = "10"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-bastion.id 
 #   subnet_id  = var.subnet_ids[count.index]
#    nat ="${var.nat_["${var.hostnames[count.index]}"]}"
#    ip_address = "172.16.120.254"
  }
 
  metadata = {
    user-data = "${file("./metadata/bastion.yml")}"
    serial-port-enable = 1
  }  
}

variable "subnet_ids" {
  type  = list(string)
  default = ["subnet-bastion", "subnet-a", "subnet-b"]
}

variable "name_ids" {
  type  = list(string)
  default = ["bastion-elvm", "websrv-elvm-1", "websrv-elvm-2"]
}
