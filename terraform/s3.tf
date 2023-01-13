resource "aws_s3_bucket" "s3_bucket" {
  bucket = "rws-microfrontend-bucket"
  acl = "public-read"

  tags = {
    Name  = "Microfrontend Bucket"
  }

  policy = <<EOF
  {
    "id": "MakePublic",
    "version": "2012-10-17",
    "statement": [
      {
        "action": [
          "s3:GetObject"
        ],
        "effect": "Allow",
        "resource": "arn:aws:s3:::rws-microfrontend-bucket/*",
        "principal": "*"
      }
    ]
  }
  EOF
  
  website {
    index_document = "index.html"
  }
}
