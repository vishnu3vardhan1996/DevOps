provider "google" {
    region = "us-central1"
    zone = "us-central1-a"
}

terraform {
    required_provider {
        google {
            version = "~> 5.0"
            source = "hasicorp/google"
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