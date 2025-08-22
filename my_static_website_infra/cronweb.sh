#!/bin/bash


# This script is intended to be run as a cron job to deploy the infrastructure for the static website bucket.
# terraform -chdir="/home/damilola/Documents/Nupat/pair-programming-exercises/my_static_website_infra" init
# terraform init 
# terraform plan
# terraform validate
# terraform apply -auto-approve

# localstack start -d
# export AWS_PROFILE=localstack
# ENDPOINT=http://s3.localhost.localstack.cloud:4566

#!/bin/bash

#!/usr/bin/env bash
set -euo pipefail

# start LocalStack first
localstack start -d

# optionally: wait for S3 health here
# curl loop until "s3": "available"

# then run Terraform commands in the correct directory
terraform -chdir="/home/damilola/Documents/Nupat/pair-programming-exercises/my_static_website_infra" init -input=false
terraform -chdir="/home/damilola/Documents/Nupat/pair-programming-exercises/my_static_website_infra" validate
terraform -chdir="/home/damilola/Documents/Nupat/pair-programming-exercises/my_static_website_infra" plan -input=false
terraform -chdir="/home/damilola/Documents/Nupat/pair-programming-exercises/my_static_website_infra" apply -auto-approve -input=false








