output "main_vpc_id" {
  value = "${aws_vpc.main_vpc.id}"
}

output "main_public_subnet_id" {
  value = "${aws_subnet.main_public_subnet.id}"
}

output "main_private_subnet_id" {
  value = "${aws_subnet.main_public_subnet.id}"
}
