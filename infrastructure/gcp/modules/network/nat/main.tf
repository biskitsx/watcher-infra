
resource "google_compute_address" "nat" {
    name = "nat"
    address_type = "EXTERNAL"
    project = var.project_id
    region = var.region
    network_tier = "PREMIUM"
}


resource "google_compute_router" "router" {
    name = "router"
    region = var.region
    project = var.project_id
    network = var.vpc_id
}

resource "google_compute_router_nat" "nat" {
    name = "nat"
    router = google_compute_router.router.name
    region = var.region

    project = var.project_id
    nat_ip_allocate_option = "MANUAL_ONLY"
    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    nat_ips = [ google_compute_address.nat.self_link ]
    depends_on = [ google_compute_address.nat ]  

    subnetwork {
        name = var.subnet_private_self_link
        source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
}