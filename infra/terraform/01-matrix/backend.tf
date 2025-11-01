terraform {
  backend "s3" {
    bucket         = "agevega-dev-terraform-state"
    key            = "terraform/state/matrix/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
