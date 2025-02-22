#!/bin/bash

# Define the base directory
BASE_DIR="terraform"

# Function to create directories and files
create_structure() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
    fi
    shift
    for file in "$@"; do
        touch "$file"
    done
}

# Create main Terraform directories and files
create_structure "$BASE_DIR" "$BASE_DIR/provider.tf" "$BASE_DIR/variables.tf"

echo 'terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}' > "$BASE_DIR/provider.tf"

echo 'variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}' > "$BASE_DIR/variables.tf"

# Create modules directories and files
for module in networking ecs api_gateway monitoring; do
    create_structure "$BASE_DIR/modules/$module" "$BASE_DIR/modules/$module/main.tf"
done

echo 'resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}' > "$BASE_DIR/modules/networking/main.tf"

echo 'resource "aws_ecs_cluster" "main" {
  name = "example-cluster"
}' > "$BASE_DIR/modules/ecs/main.tf"

echo 'resource "aws_api_gateway_rest_api" "main" {
  name        = "example-api"
  description = "Example API Gateway"
}' > "$BASE_DIR/modules/api_gateway/main.tf"

echo 'resource "aws_cloudwatch_log_group" "main" {
  name = "example-log-group"
}' > "$BASE_DIR/modules/monitoring/main.tf"

# Create environments directories and files
create_structure "$BASE_DIR/environments/prod" "$BASE_DIR/environments/prod/main.tf"

echo 'provider "aws" {
  region = var.region
}' > "$BASE_DIR/environments/prod/main.tf"

# Print completion message
echo "Terraform folder structure and files created successfully."
