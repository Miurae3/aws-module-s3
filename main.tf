resource "aws_s3_bucket" "this" {
  for_each = toset(var.bucket_name)
  bucket = each.key
}