# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 6.0"
  }
  tls = {
    source  = "hashicorp/tls"
    version = "~> 4.1"
  }
}

# Bootstrap provider uses static credentials supplied via the variable store.
# These credentials only need IAM permissions to create the OIDC provider and
# the IAM role. Once the role exists, other Stacks can use OIDC authentication.
provider "aws" "this" {
  config {
    region     = var.aws_region
    access_key = var.aws_access_key_id
    secret_key = var.aws_secret_access_key
  }
}

provider "tls" "this" {
  config {}
}
