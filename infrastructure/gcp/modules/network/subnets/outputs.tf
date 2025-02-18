output "subnet_private_self_link" {
    description = "The private subnet self link"
    value = google_compute_subnetwork.private.self_link
}

