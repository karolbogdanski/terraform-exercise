region =  "us-east-2"

ami_id = "ami-00dfe2c7ce89a450b"
instance_type = "t2.micro"

instance_key = "first-key-pair"
creds = "~/.aws/credentials"

vpc_cidr = "178.0.0.0/16"
public_subnet_cidr = "178.0.10.0/24"

bucket_name = "my-terra-bucket"

role_name = "read_s3_role"