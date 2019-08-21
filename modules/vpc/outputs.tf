output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}
output "cidr" {
  value = aws_vpc.main.cidr_block
}
