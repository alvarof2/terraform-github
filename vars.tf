# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
  default     = "./terraform.json"
}

# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "us-east1"
}

# define GCP zone
variable "gcp_zone" {
  type        = string
  description = "GCP zone"
  default     = "us-east1-b"
}

# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
  default     = "axial-yen-343408"
}

variable "token" {
  type        = string
  description = "Github token"
}