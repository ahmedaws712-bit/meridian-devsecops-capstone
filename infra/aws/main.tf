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

#checkov:skip=CKV_AWS_18:Access logging omitted for free-tier capstone and documented as residual risk.
#checkov:skip=CKV_AWS_144:Cross-region replication omitted to avoid unnecessary free-tier overage.
resource "aws_s3_bucket" "static_assets" {
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
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
