resource "yandex_compute_instance" "vm-02" {
  name                      = "vm-02"
  hostname                  = "vm-02.netology.cloud"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.centos-7
      name     = "vm-02"
      type     = "network-nvme"
      size     = "30"
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.default.id
    nat        = true
    ip_address = "192.168.101.72"
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_rsa.pub")}"
  }
}