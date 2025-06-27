output "sample_variable" {
    value = google_compute_subnetwork.newsubnet[*].description
}