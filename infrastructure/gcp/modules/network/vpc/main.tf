
resource "google_compute_network" "vpc" {
    name = "main"
    routing_mode = "REGIONAL"
    auto_create_subnetworks = false
    delete_default_routes_on_create = true
    project = var.project_id
    # depends_on = [ google_project_service.api ]
}

resource "google_compute_route" "default_route" {
    name = "default-route-to-internet"
    dest_range = "0.0.0.0/0"
    network = google_compute_network.vpc.self_link
    project = var.project_id
    next_hop_gateway = "default-internet-gateway"
}