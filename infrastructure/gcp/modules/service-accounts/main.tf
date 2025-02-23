resource "google_service_account" "gke" {
    account_id = "watcher-gke-account"
    project = var.project_id
}