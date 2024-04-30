variable "aws_region" {
  description = "AWS region to create resources"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance"
  default     = "ami-0e001c9271cf7f3b9" # Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2024-04-11
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  default     = "doctolib"
}

variable "allowed_ip" {
  description = "IP address allowed to access the EC2 instance"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = "doctolib-ec2-role"
}

variable "iam_policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "doctolib-s3-write-policy"
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile"
  type        = string
  default     = "doctolib-instance-profile"
}

variable "iam_role_arn" {
  description = "ARN of the IAM role that should have access to the S3 bucket"
  type        = string
}

variable "ssh_user" {
  description = "SSH user for connecting to the EC2 instance"
  type        = string
  default     = "ubuntu"
}

variable "ssh_private_key" {
  description = "SSH private key for connecting to the EC2 instance"
  type        = string
}

variable "ssh_key_pair_name" {
  description = "Name of the SSH key pair"
  type        = string
}