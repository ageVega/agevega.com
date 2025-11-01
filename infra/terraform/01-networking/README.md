# 01-networking

Provisions the agevegacom network stack: VPC, public and private subnets, routing tables, security groups, and an EC2 key pair. The state for this module now lives in the centralized backend created by `00-terraform-state-S3`.  
💡 The NAT Gateway resources are documented but commented out in `vpc.tf` to avoid the ~33 €/mes fixed cost; uncomment them only when the budget grows.

## Prerequisites
- Run `terraform apply` inside `infra/terraform/00-terraform-state-S3` so the S3 bucket `terraform-state-agevegacom` and DynamoDB table `terraform-state-lock` exist.
- Configure AWS credentials for the `terraform` CLI profile (or override the `aws_profile` variable).

## Usage
```bash
cd infra/terraform/01-networking
terraform init    # picks up the shared S3 backend
terraform plan
terraform apply
```

The backend stores state under the key `envs/dev/agevegacom/terraform.tfstate`. Adjust it in `backend.tf` if you want to isolate other environments.

## Variables
- `aws_region` / `aws_profile`: defaults to `eu-south-2` and the `terraform` profile to align with the shared backend.
- `resource_prefix`: string used in all resource names/tags (por defecto `agevegacom`.
- `vpc_cidr`, `public_subnets`, `private_subnets`: customize the network layout.
- `availability_zones`: list of AZs used for both public and private subnets; keep at least as many entries as subnets.

Review `outputs.tf` to see which identifiers are exposed for downstream modules or stacks.
