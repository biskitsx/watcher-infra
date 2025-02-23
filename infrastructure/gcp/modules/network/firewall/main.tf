resource "google_compute_firewall" "allow_iap_ssh" {
    name = "allow-iap-ssh"
    network = var.vpc_id
    
    project = var.project_id
    allow {
        protocol = "tcp"
        ports = ["22"]
    }

    source_ranges = [
        "35.235.240.0/20"
    ]
}

resource "google_compute_firewall" "allow_egress" {
  name    = "allow-egress"
  network = var.vpc_id
  direction = "EGRESS"
  project = var.project_id
  allow {
    protocol = "all"
  }

  destination_ranges = ["0.0.0.0/0"]
}
