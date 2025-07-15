variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "localstack_endpoint" {
  description = "LocalStack endpoint URL"
  type        = string
  default     = "http://localhost:4566"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "employee-data-storage"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "localstack"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "s3_bucket_name" {
  description = "Name of project"
  type        = string
  default     = "employee-data-storage"
}

variable "s3_lifecycle_ia_days" {
  description = "Number of days after which objects transition to IA storage class"
  type        = number
  default     = 30
}

variable "s3_lifecycle_glacier_days" {
  description = "Number of days after which objects transition to Glacier storage class"
  type        = number
  default     = 90
}
variable "low_tier_ec2_instance_type" {
  description = "EC2 instance type for low tier"
  type        = string
  default     = "t2.micro"
}

variable "mid_tier_ec2_instance_type" {
  description = "EC2 instance type for mid tier"
  type        = string
  default     = "t3.medium"
}

variable "high_tier_ec2_instance_type" {
  description = "EC2 instance type for high tier"
  type        = string
  default     = "t3.large"
}

variable "ami_id_ubuntu_20_04" {
  description = "Ubuntu 20.04 LTS"
  type        = string
  default     = "ami-020cba7c55df1f615"
}

variable "ami_id_windows_2019" {
  description = "Windows Server 2019"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"

}






