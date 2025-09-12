#!/bin/bash
set -euo pipefail

BUCKET_NAME="my-static-website-04"
# ENDPOINT=https://localhost.localstack.cloud:4566
ENDPOINT=http://s3.localhost.localstack.cloud:4566

echo "Starting S3 Bucket Configuration for Static Website Hosting"

# Set AWS CLI to use LocalStack
export AWS_PROFILE=localstack
echo "Now using LocalStack AWS profile"

# Enable static website
echo "Enabling static website hosting for bucket: $BUCKET_NAME"

echo "debug start"
aws s3 ls s3://$BUCKET_NAME/
echo "debug end"

aws --endpoint-url=$ENDPOINT s3 website s3://$BUCKET_NAME \
    --index-document index.html\
    --error-document error.html

# Function to configure bucket policy
echo "Configuring bucket policy for public access"
aws s3api put-bucket-policy \
    --bucket $BUCKET_NAME \
    --policy file://bucket-policy.json 

# Confirm the bucket policy
echo "Confirming bucket policy configuration"
aws s3api get-bucket-policy --bucket $BUCKET_NAME

# Copy the static files to the S3 bucket
echo "Copying static files to S3 bucket"
aws s3 cp ../index.html s3://$BUCKET_NAME/ 
aws s3 cp ../error.html s3://$BUCKET_NAME/ 

# Confirming files in the bucket
echo "Listing files in the S3 bucket to confirm upload"
aws s3 ls s3://$BUCKET_NAME/


# echo "S3 Bucket Configuration for Static Website Hosting completed successfully"

# View bucket endpoint
# echo "Access your static website at: http://$BUCKET_NAME.s3-website.localhost.localstack.cloud"
# http://$BUCKET_NAME.s3-website.us-east-1.amazonaws.com

# Uploading vite artifacts rather than index.html
# echo "Copying Vite build artifacts to S3 bucket"
# aws s3 sync ../dist s3://$BUCKET_NAME --delete
