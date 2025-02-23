variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "vpc_id" {
    type = string
    description = "The VPC ID"  
}

variable "project_id" {
    type = string
    description = "The Project ID"  
}
variable "subnet_private_self_link" {
    type = string
    description = "The private subnet self link"
}