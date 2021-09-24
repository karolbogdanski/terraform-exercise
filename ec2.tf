resource "aws_instance" "web" {
  ami             = var.ami_id 
  instance_type   = var.instance_type
  key_name        = var.instance_key
  security_groups = [aws_security_group.sg.name]
  iam_instance_profile = aws_iam_instance_profile.test_profile.id

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo yum update -y
  sudo yum install -y httpd
  echo "*** Completed Installing apache2"
  sudo systemctl start httpd
  aws s3 cp s3://my-terra-bucket/sample-page.html /var/www/html/index.html
  EOF

  tags = {
    Name = "web_instance"
  }

  volume_tags = {
    Name = "web_instance"
  }
}