provider "google" {}

variable "name" {
  default = "instance-gpu"
}

variable "cpu" {
  default = "2"
}

variable "memory" {
  default = "8192"
}

variable "zone" {
  default = "us-central1-b"
}

variable "disk_size" {
  default = 50
}

variable "disk_image" {
  default = "deeplearning-platform-release/pytorch-latest-gpu"
}

variable "preemptible" {
  default = false
}

resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = "custom-${var.cpu}-${var.memory}"
  zone         = var.zone

  boot_disk {
    initialize_params {
      size = var.disk_size
      type = "pd-ssd"
      image = var.disk_image
    }
  }

  network_interface {
    network = "default"
  }

  guest_accelerator {
    type = "nvidia-tesla-t4"
    count = 1
  }

  scheduling {
    preemptible = var.preemptible
    automatic_restart = false
    on_host_maintenance = "TERMINATE"
  }

  metadata = {
    install-nvidia-driver = "True"
  }
}

