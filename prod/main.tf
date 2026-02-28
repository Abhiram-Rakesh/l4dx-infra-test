resource "aws_s3_bucket" "sample" {
  bucket_prefix = "l4dx-prod-sample-"
  force_destroy = true

  tags = {
    Name = "l4dx-prod-sample"
  }
}

resource "aws_s3_bucket_versioning" "sample" {
  bucket = aws_s3_bucket.sample.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "sample" {
  bucket = aws_s3_bucket.sample.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# trigger run
