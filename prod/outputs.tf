output "dmz-public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.ec2-dmz.*.public_ip
}

output "local-private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.ec2-local.*.private_ip
}