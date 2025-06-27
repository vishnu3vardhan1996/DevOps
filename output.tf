output "sample_variable" {
    # value = google_compute_subnetwork.newsubnet
    value = { for i, sample in google_compute_subnetwork.newsubnet: i => sample.description}
}