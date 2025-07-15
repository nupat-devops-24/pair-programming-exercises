# Main infrastructure resources for LocalStack

resource "aws_s3_bucket" "employee_data_storage" {
  bucket = "employee-data-storage-2"

  tags = {
    Name        = "employee-data-storage-2"
    Environment = "Dev"
  }
}

# Create VPC
resource "aws_vpc" "employee_data_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.project_name}-vpc"
    description = "VPC for employee_data_storage"
  }
}
# Create Internet Gateway

resource "aws_internet_gateway" "employee_data_igw" {
  vpc_id = aws_vpc.employee_data_vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Create S3 bucket
resource "aws_s3_bucket" "employee_data_bucket" {
  bucket = var.project_name

  tags = {
    Name       = "${var.s3_bucket_name}-bucket"
    Purpose    = "Employee Data Storage"
    Compliance = "Required"
  }
}
# resource "aws_instance" "dev_server" {
#   count = 4 # create four similar EC2 instances

#   ami           = var.ami_id_ubuntu_20_04
#   instance_type = var.low_tier_ec2_instance_type

#   tags = {
#     Name        = "MyInstance ${count.index}"
#     Environment = "Dev"
#   }
# }