output "main_vpc_id" {
    value = "${data.aws_vpc.main_vpc.id}"
}

output "main_public_subnet_id" {
  value = "${data.aws_subnet.main_public_subnet.id}"
}

output "main_private_subnet_id" {
    value = "${data.aws_subnet.main_private_subnet.id}"
}

output "main_ssh_sg_id" {
    value = "${data.aws_security_group.ssh_sg.id}"
}