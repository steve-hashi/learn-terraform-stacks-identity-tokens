# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "us-east-1"
}

variable "hcp_organization_name" {
  description = "Organization name for the OIDC trust relationship."
  type        = string
}

variable "hcp_project_name" {
  description = "Project name for the OIDC trust relationship."
  type        = string
}

variable "hcp_hostname" {
  description = "Hostname of HCP Terraform or Terraform Enterprise."
  type        = string
  default     = "app.terraform.io"
}

# Bootstrap credentials – supply via an HCP Terraform variable set.
# These are ephemeral so they never persist to Stack state.
variable "aws_access_key_id" {
  description = "AWS access key ID for bootstrapping the OIDC provider and IAM role."
  type        = string
  ephemeral   = true
}

variable "aws_secret_access_key" {
  description = "AWS secret access key for bootstrapping the OIDC provider and IAM role."
  type        = string
  ephemeral   = true
}
