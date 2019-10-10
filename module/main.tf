provider "google" {
  project = "groovy-facet-255413"
  region  = "us-east1"
  zone    = "us-east1-b"
}

resource "google_compute_instance" "vm_instance" {
  name         = var.display-name
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "rhel7"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "dev-vpc"
    access_config {
    }
    subnetwork = "dev-${var.subnet}"

  }

  count = var.server_provision
}

