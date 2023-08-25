
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "kk"
  }
}

variable "subnets_cidr" {
  type = list(string)
}

variable "subnet_name" {
  type = list(string)
}

resource "aws_subnet" "mysubnets" {
   count = length(var.subnets_cidr)
   vpc_id = aws_vpc.myvpc.id
   cidr_block = var.subnets_cidr[count.index]
   tags = {
      Name = var.subnet_name[count.index]
    }
   depends_on = [
     aws_vpc.myvpc
   ]
}

