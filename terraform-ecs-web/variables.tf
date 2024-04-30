variable "aws_region" {
  default = "us-east-1"
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
