terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "gcp-practise12"
  region  = "us-central1"
  zone    = "us-central1-a"
  credentials = file("tformkey.json")
}

resource "google_compute_instance" "sample-vm" {
  name         = "sample-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }
}