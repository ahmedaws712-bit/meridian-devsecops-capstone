terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "random_id" "suffix" {
  byte_length = 4
}

locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Owner       = "cloud-capstone"
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket" "static_assets" {
  #checkov:skip=CKV_AWS_18:Access logging omitted for free-tier capstone; documented as residual risk.
  #checkov:skip=CKV_AWS_144:Cross-region replication omitted to avoid unnecessary cost in free-tier capstone.
  #checkov:skip=CKV2_AWS_62:Event notifications omitted because no production event target is required for this static demo.
  bucket = "${var.project_name}-${var.environment}-static-${random_id.suffix.hex}"

  tags = local.common_tags
}

resource "aws_s3_bucket_public_access_block" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  rule {
    id     = "static-assets-lifecycle"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 30
    }

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}
