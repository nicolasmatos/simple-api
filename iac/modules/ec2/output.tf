output "ec2_id" {
  value = aws_instance.api.id
}

output "ec2_instance_type" {
  value = var.ec2_instance_type
}

output "ec2_monitoring" {
  value = var.monitoring
}

output "key_name" {
  value = var.key_name
}

output "iam_instance_profile" {
  value = aws_iam_instance_profile.instance_profile_ec2.name
}
