terraform {
  backend "s3" {
    bucket         = "backend-antonin-tf"
    key            = "ProjetM2/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    region         = "eu-west-3"
    encrypt        = true
  }
}
