
resource "google_compute_address" "nat" {
    name = "nat"
    address_type = "EXTERNAL"
    network_tier = "PREMIUM"

    depends_on = [ google_compute_network.vpc ] 
}


resource "google_compute_router" "router" {
    name = "router"
    region = var.region
    network = google_compute_network.vpc.id
}

resource "google_compute_router_nat" "nat" {
    name = "nat"
    router = google_compute_router.router.name
    region = var.region

    nat_ip_allocate_option = "MANUAL_ONLY"
    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    nat_ips = [ google_compute_address.nat.self_link ]
    depends_on = [ google_compute_address.nat ]  

    subnetwork {
        name = google_compute_subnetwork.private.self_link
        source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
    }
}