# Terraform AWS Technical Test Documentation

This repository holds the Terraform code necessary for provisioning AWS resources as per the technical test requirements.

## Prerequisites

Ensure these tools are installed on your system:

- [Terraform](https://www.terraform.io/downloads.html) (version 0.12 or later)
- [AWS CLI](https://aws.amazon.com/cli/), configured with your AWS credentials

## Setup Instructions

Execute the following steps to deploy resources using Terraform:

### 1. Clone the Repository
Clone this repository to your local machine:
```bash
git clone https://github.com/hkowrada/testDocto.git
```

### 2. Change Directory
Navigate to the repository directory:
```bash
cd testDocto
```

### 3. Initialize Terraform
Prepare your Terraform environment:
```bash
terraform init
```

### 4. Configure Variables
Update the `terraform.tfvars` file with appropriate values:
```plaintext
aws_region         = "us-east-1"
ami_id             = "ami-0e001c9271cf7f3b9"
instance_type      = "t2.micro"
instance_name      = "doctolib"
bucket_name        = "doctolibs3bucket"
iam_role_arn       = "arn:aws:iam::730335412610:role/doctolib-ec2-role"
ssh_user           = "ubuntu"
ssh_private_key    = "path/to/your/private-key.pem"
ssh_key_pair_name  = "your-ssh-key-pair-name"
```

### 5. Preview Changes
Generate a Terraform plan:
```bash
terraform plan
```

### 6. Deploy Resources
Apply the Terraform configuration:
```bash
terraform apply
```
Confirm with `yes` when prompted.

### 7. Confirm Deployment
Monitor the provisioning process; outputs will be displayed upon completion.

## Accessing the EC2 Instance

Connect to the EC2 instance via SSH:
```bash
ssh -i path/to/your/private-key.pem ubuntu@<public-ip-address>
```
Replace placeholder values accordingly. Verify software installation with `docker --version` and `docker-compose --version`.

## Accessing the Web Server

To reach the web server hosted on ECS:

1. Retrieve the DNS name or public IP from the Application Load Balancer via Terraform outputs or AWS Management Console.
2. Access the server through your browser using the retrieved address.

## Cleanup

Remove all provisioned resources:
```bash
terraform destroy
```
Confirm with `yes` when prompted.

## Thank you

