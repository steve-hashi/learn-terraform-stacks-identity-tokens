terraform {
  required_version = ">= 1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
  }

  cloud {
    organization = "sarah-test-org"
    workspaces {
      name    = "learn-terraform-stacks-identity-tokens"
      project = "steve-learning"
    }
  }
}
