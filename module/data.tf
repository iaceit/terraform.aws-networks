data "aws_vpc" "main_vpc" {
    filter {
        name = "tag:Name"
        values = ["main_vpc"]
    }

    filter {
        name = "tag:repo"
        values = ["${var.repo}"]
    }
}

data "aws_subnet" "main_public_subnet" {
    filter {
        name = "tag:Name"
        values = ["main_public_subnet"]
    }

    filter {
        name = "tag:repo"
        values = ["${var.repo}"]
    }
}

data "aws_subnet" "main_private_subnet" {
    filter {
        name = "tag:Name"
        values = ["main_private_subnet"]
    }

    filter {
        name = "tag:repo"
        values = ["${var.repo}"]
    }
}

data "aws_security_group" "internal_sg" {
    filter {
        name = "tag:Name"
        values = ["internal_sg"]
    }

    filter {
        name = "tag:repo"
        values = ["${var.repo}"]
    }
}

data "aws_security_group" "cloudflare_sg" {
    filter {
        name = "tag:Name"
        values = ["cloudflare_sg"]
    }

    filter {
        name = "tag:repo"
        values = ["${var.repo}"]
    }
}

data "aws_security_group" "ssh_sg" {
    filter {
        name = "tag:Name"
        values = ["ssh_sg"]
    }

    filter {
        name = "tag:repo"
        values = ["${var.repo}"]
    }
}
