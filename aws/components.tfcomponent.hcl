# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "iam" {
  source = "./modules/iam"

  inputs = {
    aws_region            = var.aws_region
    hcp_organization_name = var.hcp_organization_name
    hcp_project_name      = var.hcp_project_name
    hcp_hostname          = var.hcp_hostname
  }

  providers = {
    aws = provider.aws.this
    tls = provider.tls.this
  }
}
