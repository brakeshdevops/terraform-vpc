resource "aws_subnet" "public_subnets" {
  count = length(var.PUBLIC_VPC_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PUBLIC_VPC_CIDR[count.index]

  tags = {
    Name = "public-subnet-${count.index}"
  }
}
resource "aws_subnet" "private_subnets" {
  count = length(var.PRIVATE_VPC_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PRIVATE_VPC_CIDR[count.index]

  tags = {
    Name = "private-subnet-${count.index}"
  }
}