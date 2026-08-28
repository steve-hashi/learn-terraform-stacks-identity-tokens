terraform {
  required_version = ">= 1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }

  cloud {
    organization = var.hcp_organization_name
    workspaces {
      name    = "learn-terraform-stacks-identity-tokens"
      project = var.hcp_project_name
    }
  }
}
