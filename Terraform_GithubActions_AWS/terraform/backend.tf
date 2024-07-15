terraform {
  backend "s3"{
    bucket = "mingyu110-tf-state"
    key    = "personal-portfolio/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}