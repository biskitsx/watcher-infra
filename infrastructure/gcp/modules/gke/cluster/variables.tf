variable "vpc_self_link" {
    type = string
    description = "The VPC self link"
}

variable "subnet_private_self_link" {
    type = string
    description = "The private subnet self link"
}

variable "project_id" {
    type = string
    description = "The GCP project ID"
}

variable "location" {
    type = string
    description = "The GCP location"
}