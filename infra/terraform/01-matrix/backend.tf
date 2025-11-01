terraform {
  backend "s3" {
    bucket         = "terraform-state-agevega-com"
    key            = "envs/lab/agevega.com/terraform.tfstate"
    region         = "eu-south-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    profile        = "terraform"
  }
}
