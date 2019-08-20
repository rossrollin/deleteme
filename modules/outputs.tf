output "elb_address" {
  value = aws_elb.ims_store.dns_name
}

output "addresses" {
  value = aws_instance.ims_store[*].public_ip
}

output "public_subnet_id" {
  value = module.aws_vpc.public_subnet_id
}