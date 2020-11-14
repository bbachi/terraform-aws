terraform {
  backend "s3" {
    bucket = "prod-trfm-state"
    key    = "terraform/terraform.state"
    region = "us-east-1"
  }
}