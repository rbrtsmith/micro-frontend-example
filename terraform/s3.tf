resource "aws_s3_bucket" "website_bucket" {
  bucket = var.website_bucket_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "arn:aws:s3:::${var.website_bucket_name}/*"
      }
    ]
  })
  tags = {
    Name  = "Microfrontend Bucket"
  }
}

resource "aws_s3_bucket_acl" "website_bucket_acl" {
  bucket = aws_s3_bucket.website_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website_bucket_config" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "/container/latest/index.html"
  }
  error_document {
    suffix = "/container/latest/index.htmll"
  }
}
