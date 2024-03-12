provider "aws" {
  region = "us-east-1"
}

# backend
terraform {
  backend "s3" {
    bucket = "global-terrafrm-rs-statefile"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# s3
resource "aws_s3_bucket" "my_bucket" {
  bucket = "testdoc-rc-code"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

# index
resource "aws_s3_bucket_object" "index_file" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "index.html"
  source = "docs/build/html/index.html"
  content_type = "text/html"
}

# error
resource "aws_s3_bucket_object" "error_file" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "error.html"
  source = "docs/build/html/error.html"
  content_type = "text/html"
}
