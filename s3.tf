resource "aws_s3_bucket" "jchung_s3_bucket" {
  bucket = var.bucket_name
}

# Apply versioning to logging bucket for backup purposes
resource "aws_s3_bucket_versioning" "jchung_s3_bucket_versioning" {
  bucket = aws_s3_bucket.jchung_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

#tfsec:ignore:encryption-customer-key
resource "aws_s3_bucket_server_side_encryption_configuration" "jchung_s3_server_side_encryption" {
  bucket = aws_s3_bucket.jchung_s3_bucket.id

  rule {
    bucket_key_enabled = true
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "jchung_s3_bucket_ownership_controls" {
  bucket = aws_s3_bucket.jchung_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "jchung_s3_bucket_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.jchung_s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "jchung_s3_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.jchung_s3_bucket_ownership_controls,
    aws_s3_bucket_public_access_block.jchung_s3_bucket_bucket_public_access_block,
  ]
  bucket = aws_s3_bucket.jchung_s3_bucket.id
  acl    = "private"
}

# Logging bucket for jchung_s3_bucket
#tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "jchung_logging_bucket" {
  bucket        = var.logging_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_logging" "jchung_s3_logging" {
  bucket = aws_s3_bucket.jchung_s3_bucket.id

  target_bucket = aws_s3_bucket.jchung_logging_bucket.id
  target_prefix = "log/"
}

#tfsec:ignore:encryption-customer-key
resource "aws_s3_bucket_server_side_encryption_configuration" "jchung_s3_logging_bucket_encryption" {
  bucket = aws_s3_bucket.jchung_logging_bucket.id

  rule {
    bucket_key_enabled = true
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "jchung_s3_logging_bucket_ownership_controls" {
  bucket = aws_s3_bucket.jchung_logging_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "jchung_s3_logging_bucket_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.jchung_logging_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


# Apply versioning to logging bucket for backup purposes
resource "aws_s3_bucket_versioning" "jchung_logging_bucket_versioning" {
  bucket = aws_s3_bucket.jchung_logging_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Upload the docker compose file to S3 bucket
resource "aws_s3_object" "docker_compose_file" {
  bucket = aws_s3_bucket.jchung_s3_bucket.id
  depends_on = [
    aws_s3_bucket_ownership_controls.jchung_s3_bucket_ownership_controls,
    aws_s3_bucket_public_access_block.jchung_s3_bucket_bucket_public_access_block,
  ]
  key          = var.docker_file
  source       = "${path.root}/${var.docker_file}"
  content_type = "application/yaml"
  etag         = filemd5("${path.root}/${var.docker_file}")
}