resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "kk"
  }
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