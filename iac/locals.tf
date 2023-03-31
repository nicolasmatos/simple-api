locals {
  tags = {
    owner       = var.owner
    project     = var.project_name
    terraform   = var.terraform
    environment = var.environment
  }
}
