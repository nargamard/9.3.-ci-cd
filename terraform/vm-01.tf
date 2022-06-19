resource "yandex_compute_instance" "vm-01" {
  name                      = "vm-01"
  hostname                  = "vm-01.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.centos-7
      name     = "vm-01"
      type     = "network-nvme"
      size     = "30"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.default.id
    nat        = true
    ip_address = "192.168.101.71"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}