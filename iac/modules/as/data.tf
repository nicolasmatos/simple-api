data "aws_ami" "api" {
  most_recent = true
  filter {
    name   = "name"
    values = ["${var.project_name}-api"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["${var.owner}"]
}
