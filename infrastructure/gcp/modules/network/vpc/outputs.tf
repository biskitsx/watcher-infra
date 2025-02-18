output "vpc_id" {
    description = "ID of the VPC"
    value = google_compute_network.vpc.id
}

output "self_link" {
    description = "Self link of the VPC"
    value = google_compute_network.vpc.self_link
}