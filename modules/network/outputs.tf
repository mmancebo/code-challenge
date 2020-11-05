output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "public_id" {
  description = "The public ID of the Subnet"
  value       = aws_subnet.public.id
}

output "private_id" {
  description = "The private ID of the Subnet"
  value       = aws_subnet.private.id
}