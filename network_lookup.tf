data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_vpc" "production_vpc" {
  tags = {
    Name = "project-production-vpc"
  }
}

data "aws_subnet" "public_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["project-public-subnet-1"]
  }
}

data "aws_subnet" "public_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["project-public-subnet-2"]
  }
}

data "aws_subnet" "public_subnet_3" {
  filter {
    name   = "tag:Name"
    values = ["project-public-subnet-3"]
  }
}


data "aws_subnet" "private_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["project-private-subnet-1"]
  }
}

data "aws_subnet" "private_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["project-private-subnet-2"]
  }
}

data "aws_subnet" "private_subnet_3" {
  filter {
    name   = "tag:Name"
    values = ["project-private-subnet-3"]
  }
}



