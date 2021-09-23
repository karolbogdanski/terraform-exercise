region =  "us-east-2"
instance_type = "t2.micro"
instance_key = "first-key-pair"

creds = "~/.aws/credentials"

vpc_cidr = "178.0.0.0/16"
public_subnet_cidr = "178.0.10.0/24"

bucket_name = "my-terra-bucket"

role_name = "read-s3-role"