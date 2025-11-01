terraform {
  backend "s3" {
    bucket         = "terraform-state-agevegacom"
    key            = "envs/dev/agevegacom/terraform.tfstate"
    region         = "eu-south-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    profile        = "terraform"
  }
}
