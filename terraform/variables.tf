variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "dummy-data-generator"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Project     = "Dummy Data Generator"
    Environment = "Production"
    Terraform   = "true"
  }
}

variable "subnets" {
  description = "List of subnets for ECS"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups for ECS services"
  type        = list(string)
}

variable "grafana_admin_password" {
  description = "Admin password for Grafana"
  type        = string
  sensitive   = true
}
