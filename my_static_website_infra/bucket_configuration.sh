#!/bin/bash

BUCKET_NAME="my-static-website-04"
ENDPOINT=https://localhost.localstack.cloud:4566

echo "Starting S3 Bucket Configuration for Static Website Hosting"

# Set AWS CLI to use LocalStack
export AWS_PROFILE=localstack

# Enable static website
aws --endpoint-url=$ENDPOINT s3 website s3://my-website-04/
    --index-document index.html
    --error-document error.html

# Function to configure bucket policy
aws s3api put-bucket-policy \
    policy file://bucket-policy.json \

echo "Bucket policy is successfully configured"



