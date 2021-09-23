resource "aws_s3_bucket" "bucket_name" {
    bucket = "${var.bucket_name}" 
    acl = "${var.acl_value}"   
}

resource "aws_s3_bucket_object" "silly-little-page" {
  for_each = fileset(".", "sample-page.html")
  bucket = aws_s3_bucket.bucket_name.id
  key    = each.value
  acl    = "private"
  source = "./${each.value}"
  etag = filemd5("./${each.value}")

}