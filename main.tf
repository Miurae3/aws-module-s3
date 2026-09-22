resource "aws_s3_bucket" "this" {
  for_each = toset(var.bucket_name)
  bucket = each.value
}

resource "aws_s3_bucket_versioning" "this" {
  for_each = aws_s3_bucket.this

  bucket = each.value.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_website_configuration" "this" {
  for_each = var.website_enabled ? aws_s3_bucket.this : {}

  bucket = each.value.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}