resource "random_password" "password" {
  length           = 32
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "14"
  identifier             = var.db_name
  instance_class         = var.db_instance_type
  db_name                = var.db_name
  username               = var.db_user
  password               = random_password.password.result
  port                   = var.db_port
  availability_zone      = data.aws_availability_zones.available.names[0]
  skip_final_snapshot    = true
  db_subnet_group_name   = var.db_group_private
  vpc_security_group_ids = var.sg_rds
  tags = merge(
    var.tags,
    {
      Name = "db-${var.project_name}"
    }
  )
}

resource "aws_secretsmanager_secret" "secrets" {
  description             = "Used for storing sensitive data, generated by terraform"
  name                    = lower("/${var.project_name}/terraform-secrets")
  recovery_window_in_days = 0
  tags = merge(
    var.tags,
    {
      Name = "sm-${var.project_name}"
    }
  )
}

resource "aws_secretsmanager_secret_version" "rds" {
  secret_id = aws_secretsmanager_secret.secrets.id
  secret_string = jsonencode(
    {
      "DB_DATABASE" = aws_db_instance.rds.db_name,
      "DB_HOST"     = aws_db_instance.rds.endpoint,
      "DB_PORT"     = aws_db_instance.rds.port,
      "DB_USER"     = aws_db_instance.rds.username,
      "DB_PASSWORD" = random_password.password.result
    }
  )
}