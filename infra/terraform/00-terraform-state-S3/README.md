# 00-terraform-state-S3

Crea el bucket S3 (versionado, cifrado, privado) y la tabla DynamoDB (PITR) para el estado remoto y locking de Terraform.

---

## 🧩 Uso

```bash
terraform init
terraform plan
terraform apply
```

---

## ⚙️ Valores por defecto

- **Región:** `eu-south-2`
- **Perfil AWS CLI:** `terraform`
- **Bucket:** `terraform-state-agevega.com`
- **Tabla:** `terraform-state-lock`

---

## 🗄️ Cómo usar este backend en tus proyectos Terraform

En los **proyectos que consuman** el backend, añade un bloque `backend "s3"`  
*(no en esta carpeta, sino en el root del proyecto que quieras gestionar)*:

```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-state-agevega.com"
    key            = "envs/dev/terraform.tfstate" # ajusta la ruta lógica
    region         = "eu-south-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    profile        = "terraform"
  }
}
```

---

## 📋 Orden recomendado

```bash
# 1. Crear el backend
cd infra/00-terraform-state-S3
terraform init
terraform apply

# 2. Usar el backend desde otro módulo/proyecto
# (añadir el bloque backend "s3" y ejecutar)
terraform init
```
