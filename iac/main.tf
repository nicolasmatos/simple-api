module "network" {
  source = "./modules/network"

  aws_region   = var.aws_region
  project_name = var.project_name
  tags         = local.tags
}
