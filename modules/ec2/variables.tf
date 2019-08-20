variable "ssh_keypair" {
    type        = string
    description = "ssh key pair to be provisioned on the instance"
}
variable "ec2_count" {
    default = "2"
}   
variable "instance_type" {
    default = "t2.micro"
}
variable "subnet_cidr" {
    default = "10.8.8.0/16"
}
variable "subnet_id" {
    default = ""
}
variable "availability_zone" {
  type        = string
  description = "Availability Zone the instance is launched in. If not set, will be launched in the first AZ of the region"
  default     = ""
}
variable "root_volume_type" {
  type        = string
  description = "Type of root volume. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root volume in gigabytes"
  default     = 10
}
variable "security_groups" {
    type        = list(string)
    description = "list of security groups"
    default     = []
}
variable "ami_id" { 
    type        = string 
    description = "The AMIs to use based on region"
}

#This is a list for ec2 instance names. This is how you spawn multiple instances, by creating a list and by cycling through
#variable "ec2_instance_names"{ 
#    type    = "list"
#    default = ["list","of","ec2","instances"]
#}
