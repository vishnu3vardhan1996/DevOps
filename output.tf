output "sample_variable" {
    value = { for i, sample in google_compute_subnetwork.newsubnet: i => sample.description}
}