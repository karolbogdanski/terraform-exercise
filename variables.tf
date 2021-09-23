variable "region" {
default = "us-east-2"
}
variable "instance_type" {
default = "t2.micro"
}
variable "creds" {
default = "~/.aws/credentials"
}
variable "instance_key" {
default = "aws_ec2_pem_file_name2"
}
variable "vpc_cidr" {
default = "178.0.0.0/16"
}
variable "public_subnet_cidr" {
default = "178.0.10.0/24"
}

variable "bucket_name" {
    default = "my-terra-bucket"
}

variable "acl_value" {
    default = "private"
}