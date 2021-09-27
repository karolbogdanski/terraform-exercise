data "template_file" "user_data" {
  template = file("user_data.tpl")

  vars = {
    bucket_name = var.bucket_name
  }
}


resource "aws_launch_configuration" "kb_launch_config" {
  name                   = "kb-config"
  image_id             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.instance_key
  security_groups = [aws_security_group.sg.name]
  enable_monitoring      = true
  iam_instance_profile = aws_iam_instance_profile.test_profile.id

  user_data = data.template_file.user_data.template
}

resource "aws_autoscaling_group" "kb_scalling" {
    name                 = "kb_scl"
    launch_configuration = aws_launch_configuration.kb_launch_config.name
    min_size             = 1
    max_size             = 3
    availability_zones   = ["us-east-2a"]
}