resource "aws_s3_bucket" "terraform_state" {
  count = length(var.environment)
  bucket = "${var.environment[count.index].name}-${var.environment[count.index].terraform_state_bucket}"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  count = length(var.environment)
  name         = "${var.environment[count.index].name}-${var.environment[count.index].terraform_lock_db}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}