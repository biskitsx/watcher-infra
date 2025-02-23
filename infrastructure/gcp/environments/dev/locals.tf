locals {
  project_id = "infrastructure-watcher"
  region = "asia-southeast1"
  apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "logging.googleapis.com",
    "secretmanager.googleapis.com"
  ]
  location = "asia-southeast1-a"
}