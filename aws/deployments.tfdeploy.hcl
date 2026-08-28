# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Pull all configuration from a single HCP Terraform variable set so there
# are no hard-coded values in this file.
#
# Create a variable set named "aws-bootstrap-credentials" in your HCP
# Terraform project with the following Terraform variables and attach it to
# this Stack:
#
#   aws_access_key_id     = "<your-access-key-id>"
#   aws_secret_access_key = "<your-secret-access-key>"
#   hcp_organization_name = "<your-hcp-org>"        # e.g. "my-org"
#   hcp_project_name      = "<your-hcp-project>"    # e.g. "my-project"
#
# HCP Terraform does not expose built-in runtime variables for org/project,
# so a variable set is the idiomatic way to inject these values without
# hard-coding them here.
store "varset" "aws_bootstrap" {
  name     = "aws-bootstrap-credentials"
  category = "terraform"
}

deployment "bootstrap" {
  inputs = {
    aws_region            = "us-east-1"
    hcp_organization_name = store.varset.aws_bootstrap.hcp_organization_name
    hcp_project_name      = store.varset.aws_bootstrap.hcp_project_name
    hcp_hostname          = "app.terraform.io"
    aws_access_key_id     = store.varset.aws_bootstrap.aws_access_key_id
    aws_secret_access_key = store.varset.aws_bootstrap.aws_secret_access_key
  }
}
