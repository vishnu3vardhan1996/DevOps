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
    type = list(object({
        name = string
        subnet = string
        descriptionvalue = string
    }))
    default = [
        {
            name = "terraform-subnet1"
            subnet = "10.0.0.0/19"
            descriptionvalue = "first subnet!"
        },
        {
            name = "terraform-subnet2"
            subnet = "10.0.64.0/19"
            descriptionvalue = "second subnet!"
        }
    ]
}

resource "google_compute_network" "isolate_network" {
    name = "terraform-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "newsubnet" {
    for_each = { for i, value in var.subnets: i => value }
    name = each.value.name
    ip_cidr_range = each.value.subnet
    region = "us-central1"
    description = each.value.descriptionvalue
    network = google_compute_network.isolate_network.id
}

# resource "google_compute_subnetwork" "newsubnet" {
#     for_each = toset(var.subnets)
#     name = "terraform-subnet"
#     ip_cidr_range = each.value
#     region = "us-central1"
#     network = google_compute_network.isolate_network.id
# }