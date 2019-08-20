resource "aws_instance" "ec2" {
    count           = var.ec2_count
    ami             = var.ami_id
    instance_type   = var.instance_type
    subnet_id       = var.subnet_id
    key_name        = var.ssh_keypair
}
