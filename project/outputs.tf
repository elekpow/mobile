
output "internal_ip_address_vm-ter" {
  value = yandex_compute_instance.vm-ter[*].network_interface.0.ip_address
}


output "external_ip_address_vm-ter" {
  value = yandex_compute_instance.vm-ter[*].network_interface.0.nat_ip_address
}

