resource "aws_s3_bucket" "website_bucket" {
  bucket = "rws-microfrontend-bucket"
  acl = "public-read"

  tags = {
    Name  = "Microfrontend Bucket"
  }
}

resource "aws_s3_bucket_website_configuration" "website_bucket_config" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }
}
