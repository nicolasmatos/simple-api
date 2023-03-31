module "network" {
  source = "./modules/network"

  aws_region   = var.aws_region
  project_name = var.project_name
  tags         = local.tags
}

module "rds" {
  source = "./modules/rds"

  aws_region       = var.aws_region
  project_name     = var.project_name
  db_group_private = module.network.db_group_private_id
  sg_rds           = [module.network.sg_rds_id]
  tags             = local.tags

  depends_on = [module.network]
}
