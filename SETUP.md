# Creating an S3 Bucket with Terraform for Hosting a Static Webpage

This guide will walk you through the process of using Terraform to create an Amazon S3 bucket and configuring it to host a static website.

## Prerequisites
- An AWS account
- Terraform installed and configured

## Step 1: Set Up Terraform for AWS
Ensure you have Terraform installed and your AWS credentials configured for Terraform. This typically involves setting up your AWS access key ID and secret access key as environment variables or through a shared credentials file.

## Step 2: Create a Terraform Configuration File
Create a file named `main.tf` and add the following configuration to define an S3 bucket resource. Replace `YOUR-BUCKET-NAME` with a unique name for your bucket and adjust the region as necessary.

```hcl
resource "aws_s3_bucket" "my_bucket" {
  bucket = "YOUR-BUCKET-NAME"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[{
    "Sid":"PublicReadGetObject",
        "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::YOUR-BUCKET-NAME/*"]
    }
  ]
}
POLICY
}
```


