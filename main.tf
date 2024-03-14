# provider
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

# s3 public access
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# s3 bucket objects
resource "aws_s3_bucket_object" "build" {
  for_each = fileset("/docs/build/html", "**/*")
  bucket = aws_s3_bucket.my_bucket.id
  key    = each.value
  source = "/docs/build/html/${each.value}"
  # etag   = filemd5("/docs/build/html/${each.value}")
}

# s3 bucket policy
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
      },
    ],
  })
}
