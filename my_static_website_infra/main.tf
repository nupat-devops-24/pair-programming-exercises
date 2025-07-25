# Main infrastructure resources for LocalStack

resource "aws_s3_bucket" "static_website" {
  bucket = "my-static-website-04"

  tags = {
    Name        = "my-static-website-04"
    Environment = "Dev"
  }
}

