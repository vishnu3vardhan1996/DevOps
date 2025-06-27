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

variable "subnets" {
    type = list(string)
    default = ["10.0.32.0/19", "10.0.0.0/19"]
}

resource "google_compute_network" "isolate_network" {
    name = "terraform-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "newsubnet" {
    for_each = toset(var.subnets)
    name = "terraform-subnet"
    ip_cidr_range = each.value
    region = "us-central1"
    network = google_compute_network.isolate_network.id
}