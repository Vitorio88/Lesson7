provider "aws" {
    region = "eu-central-1b"
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "Lesson7"

    lifecycle {
        prevent_destroy = true
       }

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
    name = "Lesson7"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    
    attribute {
        name = "LockID"
        type = "S"
    }
}