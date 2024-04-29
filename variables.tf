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