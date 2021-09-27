resource "aws_iam_policy" "read_s3_policy" {
  policy = data.aws_iam_policy_document.read_s3_policy_data.json
}


data "aws_iam_policy_document" "read_s3_policy_data" {
      statement {
        sid = "abc"

        actions = [
                "s3:Get*",
                "s3:List*"
        ]

        resources = [
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }
}

resource "aws_iam_role" "read_s3_role" {
  name = var.role_name
  permissions_boundary = "arn:aws:iam::113304117666:policy/DefaultBoundaryPolicy"
  assume_role_policy = jsonencode({
  
    "Version": "2012-10-17",
    
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]

  })
}

resource "aws_iam_role_policy_attachment" "attach" {
  role = aws_iam_role.read_s3_role.name
  policy_arn = aws_iam_policy.read_s3_policy.arn
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.read_s3_role.name
}