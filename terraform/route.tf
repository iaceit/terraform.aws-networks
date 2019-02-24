# Route tables -- public and private
resource "aws_route_table" "main_public_route_table" {
  vpc_id = "${aws_vpc.main_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main_igw.id}"
  }

  tags = "${merge(map("Name" , "main_public_route_table"),var.tags)}"
}

resource "aws_route_table_association" "main_public_subnet_route_table_association" {
  subnet_id      = "${aws_subnet.main_public_subnet.id}"
  route_table_id = "${aws_route_table.main_public_route_table.id}"
}

resource "aws_route_table" "main_private_route_table" {
  vpc_id = "${aws_vpc.main_vpc.id}"

  tags = "${merge(map("Name" , "main_private_route_table"),var.tags)}"
}

resource "aws_route_table_association" "main_private_subnet-a_route_table_association" {
  subnet_id      = "${aws_subnet.main_private_subnet-a.id}"
  route_table_id = "${aws_route_table.main_private_route_table.id}"
}

resource "aws_route_table_association" "main_private_subnet-b_route_table_association" {
  subnet_id      = "${aws_subnet.main_private_subnet-b.id}"
  route_table_id = "${aws_route_table.main_private_route_table.id}"
}
