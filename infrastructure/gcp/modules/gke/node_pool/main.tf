resource "google_container_node_pool" "general" {
    name = "general"
    cluster = var.cluster_id
    project = var.project_id

    autoscaling {
        min_node_count = 1
        max_node_count = 2 
    }

    management {
        auto_repair = true
        auto_upgrade = true
    }

    node_config {
        preemptible = false
        machine_type = "e2-medium"
        labels = {
            role = "general"
        }
        service_account = var.service_account_email

        oauth_scopes = [
            "https://www.googleapis.com/auth/cloud-platform"
        ]
    }

}