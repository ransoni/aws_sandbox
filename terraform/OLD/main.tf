terraform {
  backend "s3" {
    bucket = "ps-mikat-terrastate"
    key    = "dev/terraform-dev.tfstate"
    region = "eu-central-1"
  }
}