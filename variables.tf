variable "region" {
default = "us-east-2"
}

variable "ami_id" {
default = "ami-00dfe2c7ce89a450b"
}
variable "instance_type" {
default = "t2.micro"
}
variable "creds" {
default = "~/.aws/credentials"
}
variable "instance_key" {
default = "first-key-pair"
}

variable "default_vpc_id" {
default= "vpc-d8ef86b3"
}
variable "bucket_name" {
    default = "my-terra-bucket"
}

variable "acl_value" {
    default = "private"
}

variable "role_name"{
    default = "test-role"
}