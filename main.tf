resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_subnet_1" {
  name           = var.vpc_subnet_name_1
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "develop_subnet_2" {
  name           = var.vpc_subnet_name_2
  zone           = var.add_zone_1b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.add_cidr_1b
}

data "yandex_compute_image" "ubuntu" {
  family = var.family
}

resource "yandex_compute_instance" "platform" {
#  name        = var.vm_web_name
  name        = local.vm_name_1
  platform_id = var.vm_web_platform_id
  resources {
#    cores         = var.vm_web_cores
#    memory        = var.vm_web_memory
#    core_fraction = var.vm_web_core_fraction
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_subnet_1.id
    nat       = var.vm_web_nat
  }
#  metadata = {
#    serial-port-enable = var.vm_web_serial-port-enable
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }
  metadata = var.metadata
}

resource "yandex_compute_instance" "netology-develop-platform-db" {
#  name        = var.vm_db_name
  name        = local.vm_name_2
  platform_id = var.vm_db_platform_id
  zone = "ru-central1-b"
  resources {
#    cores         = var.vm_db_cores
#    memory        = var.vm_db_memory
#    core_fraction = var.vm_db_core_fraction
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_subnet_2.id
    nat       = var.vm_db_nat
  }
#  metadata = {
#    serial-port-enable = var.vm_db_serial-port-enable
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#  }
  metadata = var.metadata
}

resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = var.folder_id
  name = var.gateway_name
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  folder_id      = var.folder_id
  name       = var.route_table_name
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}