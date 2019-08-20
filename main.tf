provider "aws" { #If you are new to terraform, these variables are initialised from vars.tf and stored in terraform.tfvars. Terraform.tfvars are where they actually live
        access_key = var.access_key
        secret_key = var.secret_key
        region     = var.aws_region
        profile    = "terraform"
}

module "aws_vpc" {
    source        = "./modules/vpc"
    name          = "ims-aus"
    cidr          = "10.8.0.0/16"
    public_subnet = "10.8.8.0/24"
}

resource "aws_instance" "ims-store" {
    ami                         = var.ami[var.aws_region]
    instance_type               = var.instance_type
    subnet_id                   = module.aws_vpc.public_subnet_id
    associate_public_ip_address = true

    vpc_security_group_ids      = [aws_security_group.web_host_sg.id,]
    count                       = 2
}
resource "aws_elb" "web" {
    name            = "ims-store-elb"
    subnets         = [module.aws_vpc.public_subnet_id]
    security_groups = [aws_security_group.web_inbound_sg.id]
    listener {
        instance_port     = 80
        instance_protocol = "http"
        lb_port           = 80
        lb_protocol       = "http"
    }
    instances       = aws_instance.ims-store.*.id
}
resource "aws_security_group" "web_inbound_sg" {
  name            = "web-inbound-sg"
  description     = "Allow inbound http"
  vpc_id          = module.aws_vpc.vpc_id
  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"

      cidr_blocks = ["0.0.0.0/0",]
  }
  ingress {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"

      cidr_blocks = ["0.0.0.0/0",]
  }
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"

      cidr_blocks = ["0.0.0.0/0",]
  }

}
resource "aws_security_group" "web_host_sg" {
  name            = "web-host-sg"
  description     = "Allow inbound http"
  vpc_id          = module.aws_vpc.vpc_id
  ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"

      cidr_blocks = [module.aws_vpc.cidr]
  }
    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"

      cidr_blocks = ["0.0.0.0/0",]
  }
      egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"

      cidr_blocks = ["0.0.0.0/0",]
  }
}
resource "aws_eip" "ims-store" { #seems count.index no longer valid, use [0] instead
    instance = aws_instance.ims-store[0].id 
    vpc      = true
}