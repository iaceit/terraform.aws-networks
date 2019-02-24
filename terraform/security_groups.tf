# Security groups -- internal only, web-cloudflare, ssh 
resource "aws_security_group" "internal_sg" {
  name        = "internal_sg"
  description = "Allow traffic from web subnets within the same VPC"
  vpc_id      = "${aws_vpc.main_vpc.id}"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.cloudflare_sg.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(map("Name" , "internal_sg"),var.tags)}"
}

resource "aws_security_group" "cloudflare_sg" {
  name        = "cloudflare_sg"
  description = "Allow HTTP, HTTPS inbound traffic from whitelisted Cloudflare IPs"
  vpc_id      = "${aws_vpc.main_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "${var.cloudflare_ips}"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = "${var.cloudflare_ips}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(map("Name" , "cloudflare_sg"),var.tags)}"
}

resource "aws_security_group" "ssh_sg" {
  name        = "ssh_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${aws_vpc.main_vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(map("Name" , "ssh_sg"),var.tags)}"
}
