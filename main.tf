provider "google" {}

resource "google_compute_instance" "default" {
  name         = "instance-gpu"
  machine_type = "custom-2-8192"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      size = 50
      type = "pd-ssd"
      image = "deeplearning-platform-release/pytorch-latest-gpu"
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
    preemptible = false
    automatic_restart = false
    on_host_maintenance = "TERMINATE"
  }

  metadata = {
    install-nvidia-driver = "True"
  }
}

