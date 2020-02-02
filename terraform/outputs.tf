output "main_vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "main_public_subnet_id" {
  value = aws_subnet.main_public_subnet.id
}

output "main_private_subnet-a_id" {
  value = aws_subnet.main_private_subnet-a.id
}

output "main_private_subnet-b_id" {
  value = aws_subnet.main_private_subnet-b.id
}

output "cloudflare_sg_id" {
  value = aws_security_group.cloudflare_sg.id
}

output "internal_sg_id" {
  value = aws_security_group.internal_sg.id
}

output "ssh_sg_id" {
  value = aws_security_group.ssh_sg.id
}

