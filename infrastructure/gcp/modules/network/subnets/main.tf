# resource "google_compute_subnetwork" "public" {
#     name = "public"
#     ip_cidr_range = "10.0.0.0/19" # range of 8192 addresses: 10.0.0.0 -> 10.0.31.255
#     region = local.region
#     network = google_compute_network.vpc.id
#     private_ip_google_access = true # allow instances to reach Google APIs without a public IP
#     stack_type = "IPV4_ONLY"
#     depends_on = [ google_compute_network.vpc ]
# }

resource "google_compute_subnetwork" "private" {
    name = "private"
    ip_cidr_range = "10.0.32.0/19"
    project = var.project_id
    region = var.region 
    network = var.vpc_id
    private_ip_google_access = true
    stack_type = "IPV4_ONLY"
    # depends_on = [ google_compute_network.vpc ]

    secondary_ip_range {
        range_name = "k8s-pods"
        ip_cidr_range = "172.16.0.0/14"
    }

    secondary_ip_range {
        range_name = "k8s-services"
        ip_cidr_range = "172.20.0.0/18"
    }
}