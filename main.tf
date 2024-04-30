provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "doctolib" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.doctolib.id]
  iam_instance_profile   = aws_iam_instance_profile.doctolib.name
  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "doctolib" {
  name_prefix = "doctolib-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_ip}/32"]
  }
}

resource "aws_s3_bucket" "doctolib" {
  bucket = var.bucket_name
}


resource "aws_s3_bucket_acl" "doctolib" {
  bucket = aws_s3_bucket.doctolib.id
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "doctolib" {
  bucket = aws_s3_bucket.doctolib.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_iam_policy" "doctolib" {
  name        = var.iam_policy_name
  path        = "/"
  description = "Allows write access to the 'can_be_written/' prefix of the S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject"
        ]
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.doctolib.arn}/can_be_written/*"
      }
    ]
  })
}

resource "aws_iam_role" "doctolib" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "doctolib" {
  policy_arn = aws_iam_policy.doctolib.arn
  role       = aws_iam_role.doctolib.name
}

resource "aws_iam_instance_profile" "doctolib" {
  name = var.iam_instance_profile_name
  role = aws_iam_role.doctolib.name
}

resource "aws_s3_bucket_policy" "doctolib" {
  bucket = aws_s3_bucket.doctolib.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:PutObject",
        Resource = "${aws_s3_bucket.doctolib.arn}/can_be_written/*",
        Principal = {
          AWS = [var.iam_role_arn]
        }
      }
    ]
  })
}
