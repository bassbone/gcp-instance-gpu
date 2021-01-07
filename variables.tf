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

