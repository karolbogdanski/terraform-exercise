resource "aws_iam_role" "read-s3-role" {
  name = var.role_name

  assume_role_policy = jsonencode({

    "Version": "2012-10-17",
    
    "Statement": [

        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::my-terra-bucket/*"
            ]
            "permissions_boundary": [
                "arn:aws:iam::113304117666:policy/DefaultBoundaryPolicy"
            ]
        }
    ]

  })
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = "${aws_iam_role.read-s3-role.name}"
}