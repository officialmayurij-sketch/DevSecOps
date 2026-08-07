provider "aws" {
  region = "us-east-1"
}

# Unencrypted S3 Bucket with Public Access Enabled (Triggers tfsec)
resource "aws_s3_bucket" "vulnerable_bucket" {
  bucket = "my-insecure-devsecops-bucket"
}

# Open Security Group allowing SSH (0.0.0.0/0) (Triggers tfsec)
resource "aws_security_group" "allow_all_ssh" {
  name        = "allow_all_ssh"
  description = "Insecure Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
