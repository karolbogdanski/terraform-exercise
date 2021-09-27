resource "aws_instance" "web" {
  ami             = var.ami_id 
  instance_type   = var.instance_type
  key_name        = var.instance_key
  security_groups = [aws_security_group.sg.name]
  iam_instance_profile = aws_iam_instance_profile.test_profile.id

  user_data = data.template_file.user_data.template

  tags = {
    Name = "web_instance"
  }

  volume_tags = {
    Name = "web_instance"
  }
}