variable "cluster_id" {
    description = "The ID of the cluster to create the node pool in"
    type = string
}

variable "service_account_email" {
    description = "The email of the service account to associate with the node pool"
    type = string  
}


variable "project_id" {
    description = "The ID of the project to create the node pool in"
    type = string
}