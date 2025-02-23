resource "google_project_iam_member" "gke_logging" {
    project = var.project_id
    role = "roles/container.admin"
    member = "serviceAccount:${var.account_email}"
}

resource "google_project_iam_member" "gke_metrics" {
    project = var.project_id
    role = "roles/monitoring.metricWriter"
    member = "serviceAccount:${var.account_email}"
}

resource "google_project_iam_member" "gke_artifact_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${var.account_email}"
}
