resource "aws_route_table" "public-table" {
vpc_id= aws_vpc.main.id
  tags= {
    Name = "public-rt"
    ENV=var.env
  }
}
resource "aws_route_table" "private-table" {
  vpc_id= aws_vpc.main.id
  tags= {
    Name = "private-rt"
    ENV=var.env
  }
}
resource "aws_route_table_association" "public" {
  count=length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets.*.id[count.index]
  route_table_id = aws_route_table.public-table.id
}
resource "aws_route_table_association" "private" {
  count=length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets.*.id[count.index]
  route_table_id = aws_route_table.private-table.id
}