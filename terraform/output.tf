
output "external_ip_address_vm-01_yandex_cloud" {
  value = yandex_compute_instance.vm-01.network_interface.0.nat_ip_address
}

output "external_ip_address_vm-02_yandex_cloud" {
  value = yandex_compute_instance.vm-02.network_interface.0.nat_ip_address
}