terraform {
  backend "s3" {
    bucket         = "backend-antonin-tf"
    key            = "ProjetM2/terraform.tfstate"
    region         = "eu-west-3"
    encrypt        = true
  }
}
