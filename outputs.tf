output "elb_address" {
  value = aws_elb.web.dns_name
}

output "addresses" {
  value = aws_instance.ims-store[*].public_ip
}

output "public_subnet_id" {
  value = module.aws_vpc.public_subnet_id
}

output "aws_eip" {
  value = aws_eip.ims-store.public_ip
}