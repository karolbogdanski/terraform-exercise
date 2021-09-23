resource "aws_iam_role" "read-s3-role" {
  name = "read-s3-role"

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
                "arn:aws:s3:::my-terra-bucket",
                "arn:aws:s3:::*/*"
            ]
        }
    ]

  })
}