
terraform {
  required_version = ">= 1.0"
}

variable "project_name" {
  description = "Name of the DevOpsX project"
  type        = string
  default     = "DevOpsX-2.0"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

locals {
  project_name = var.project_name
  environment  = var.environment

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

output "project_name" {
  value = local.project_name
}

output "environment" {
  value = local.environment
}

output "common_tags" {
  value = local.common_tags
}
