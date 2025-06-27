provider "google" {
    region = "us-central1"
    zone = "us-central1-a"
}

terraform {
    required_providers {
        google = {
            version = "~> 5.0"
            source = "hashicorp/google"
        }
    }
}

variable "vishnu" {
    type = string
    default = "test"
}

resource "google_compute_network" "isolate_network" {
    name = "terraform-network"
}