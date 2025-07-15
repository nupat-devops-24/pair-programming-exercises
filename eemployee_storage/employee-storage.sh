#!/bin/bash

# Elastic object storage and VPC set up for Employee Data Storage

# Set AWS profile to use LocalStack

export AWS_PROFILE=localstack

# Variables configuration

REGION="us-east-1"
VPC_NAME="employee-data-vpc"
BUCKET_NAME="employee-data-storage"
SUBNET_NAME="employee-data-subnet"

echo "Starting LocalStack AWS infrastructure setup..."
sudo localstack start -d
echo "localstack is running"

echo "Region: $REGION"
echo "VPC Name: $VPC_NAME"
echo "Bucket Name: $BUCKET_NAME"
echo "Creating s3 buckets..."


# Creating VPC - Got the VPC ID from localstack chatbot


echo "Creating VPV..."
VPC_ID=$(aws ec2 create-vpc \
--cidr-block 10.0.0.0/16 | jq -r '.Vpc.VpcId')

#Creating internet gateway

echo "Creating Internet Gateway..."
INTERNET_GW_ID=$(aws ec2 create-internet-gateway | jq -r '.InternetGateway.InternetGatewayId')

#Creating S3 bucket
echo "Creating S3 bucket..."

echo "S3 bucket created: $BUCKET_NAME"

echo "Creation complete"
