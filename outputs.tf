output "VPC_ID" {
  value = aws_vpc.main.id
}
output "VPC_CIDR" {
  value = var.VPC_CIDR
}
output "PUBLIC_SUBNETS" {
  value = aws_subnet.public_subnets.*.id
}
output "PRIVATE_SUBNETS" {
  value = aws_subnet.private_subnets.*.id
}
output "PUBLIC_SUBNET_CIDR" {
  value = var.PUBLIC_VPC_CIDR
}
output "PRIVATE_SUBNET_CIDR" {
  value=var.PRIVATE_VPC_CIDR
}
output "DEFAULT_VPC_ID" {
  value = data.aws_vpc.default.id
}
output "DEFAULT_VPC_CIDR" {
  value = data.aws_vpc.default.cidr_block
}
output "PRIVATE_HOSTED_ZONE_ID" {
  value = var.PRIVATE_HOSTED_ZONE_ID
}