resource "google_project_service" "api" {
    for_each = toset(var.apis)
    service = each.key
    project = var.project_id
    disable_on_destroy = false
  
}

# resource "google_project_service" "container" {
#     service = "container.googleapis.com"

#     disable_on_destroy = false  
# }

# resource "google_project_service" "logging" {
#     service = "loggin.googleapis.com"

#     disable_on_destroy = false  
# }

# resource "google_project_service" "secretmanager" {
#     service = "secretmananger.googleapis.com"

#     disable_on_destroy = false  
# }