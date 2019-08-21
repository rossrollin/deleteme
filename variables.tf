variable "aws_region" { default = "ap-southeast-2" } # Change this to suit your needs

variable "availability_zones" {
  type        = list(string)
  description = "AWS Availability Zones's"
  default     = ["ap-southeast-2a", "ap-southeast-2b"]
}
variable "access_key" {
  type        = string
  description = "The aws access key"
}
variable "secret_key" {
  type        = string
  description = "The secret access key"
}
variable "key_name" {
  type        = string
  description = "They keypair to assign to an ec2"
}
variable "instance_ips" {
  description = "Ip addresses for instances"
  default     = ["10.8.8.10"]
}
variable "ami" {
  type = map(string)
  default = {
    ap-southeast-2 = "ami-0dc96254d5535925f"
    #eu-west-2      = "ubuntu/images/"
  }
  description = "AMI to use based on region selected."
}
variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "ec2 instance type"
}
