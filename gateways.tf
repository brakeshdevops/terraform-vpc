resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env}-igw"
    ENV=var.env
  }
}
resource "aws_eip" "nat-gw" {
   vpc      = true
  tags={
    Name ="${var.env}-nat-gw-ip"
    ENV=var.env
  }
}
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat-gw.id
  subnet_id     = aws_subnet.public_subnets.*.id[0]

  tags = {
    Name = "${var.env}-ngw"
    ENV=var.env
  }
}