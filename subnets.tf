resource "aws_subnet" "public_subnets" {
  count = length(var.PUBLIC_VPC_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PUBLIC_VPC_CIDR[count.index]
  availability_zone = var.AZS[count.index]

  tags = {
    Name = "${var.env}-public-subnet-${count.index+1}"
    ENV= var.env
  }
}
resource "aws_subnet" "private_subnets" {
  count = length(var.PRIVATE_VPC_CIDR)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.PRIVATE_VPC_CIDR[count.index]

  tags = {
    Name = "${var.env}-private-subnet-${count.index+1}"
    ENV= var.env
  }
}