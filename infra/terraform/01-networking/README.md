# 01-networking

Este módulo crea la infraestructura de red base para el proyecto **agevegacom**: VPC principal, subredes públicas, privadas y de bases de datos, tablas de rutas, grupos de seguridad y registra un par de claves EC2 existente.  
El estado remoto se almacena en el backend centralizado creado por `00-terraform-state-S3`.

> 💡 **NAT Gateway pospuesto:** los recursos están documentados pero comentados en `vpc.tf` para evitar el coste fijo (~33 €/mes). Descoméntalos cuando el presupuesto lo permita.

---

## 🧩 Uso rápido

```bash
cd infra/terraform/01-networking
terraform init
terraform plan
terraform apply
```

---

## 🗂️ Prerrequisitos

1. Haber desplegado previamente el backend remoto:
   ```bash
   cd infra/terraform/00-terraform-state-S3
   terraform apply
   ```
2. Ese módulo crea:
   - Bucket S3 `terraform-state-agevegacom` (estado remoto)
   - Tabla DynamoDB `terraform-state-lock` (bloqueo de estado)

3. Proporciona la clave pública OpenSSH que hayas generado previamente (por ejemplo con `ssh-keygen -t rsa -b 4096 -f ~/.ssh/ssh_key_agevega.pub`). Puedes hacerlo creando un `terraform.tfvars`:

```hcl
test_keypair_public_key = file("~/.ssh/ssh_key_agevega.pub")
```

> ⚠️ Terraform no expande `~`; usa una ruta absoluta o un `file()` como en el ejemplo.

---

## 🗄️ Backend de estado

`backend.tf` apunta al bucket compartido y guarda el estado en:

```
envs/lab/agevegacom/terraform.tfstate
```

Modifica la clave si necesitas aislar otros entornos (por ejemplo, `envs/pre` o `envs/pro`).

---

## ⚙️ Valores por defecto

- **Región:** `eu-south-2`
- **Perfil AWS CLI:** `terraform`
- **Prefijo de recursos:** `agevegacom`
- **CIDR VPC:** `10.0.0.0/16`
- **Subredes públicas/privadas/DB:** distribuidas en `eu-south-2a`, `eu-south-2b`, `eu-south-2c`
- **NAT Gateway:** comentado por defecto (evita costes hasta que sea necesario)

---

## 🔧 Variables principales

- `aws_region` – Región de despliegue (defecto `eu-south-2`)
- `aws_profile` – Perfil de credenciales CLI (defecto `terraform`)
- `resource_prefix` – Prefijo para nombres/etiquetas (defecto `agevegacom`)
- `test_keypair_public_key` – Contenido de la clave pública (formato OpenSSH) que se registrará en AWS
- `common_tags` – Mapa de etiquetas estándar aplicadas a todos los recursos (`Project`, `Owner`, `Environment`, `IaC`)
- `vpc_cidr` – CIDR principal de la VPC (defecto `10.0.0.0/16`)
- `public_subnets` – Lista de subredes públicas
- `private_subnets` – Lista de subredes privadas
- `db_subnets` – Lista de subredes específicas para bases de datos (sin salida a Internet)
- `availability_zones` – Zonas de disponibilidad usadas (`eu-south-2a/b/c`)

El módulo registra en AWS la clave pública proporcionada (`${var.resource_prefix}-test-keypair`) y crea un security group de pruebas (`${var.resource_prefix}-test-alltraffic-sg`) para acceder por SSH a los recursos del entorno.


---

## 📤 Salidas

Revisa `outputs.tf` para consultar los IDs y valores expuestos (ej.: `vpc_id`, `subnet_public_*`, `route_table_*`, `security_group_id`).

---

## 📋 Orden recomendado

1. Crear el backend remoto:
   ```bash
   cd infra/terraform/00-terraform-state-S3
   terraform apply
   ```
2. Desplegar la red base:
   ```bash
   cd ../01-networking
   terraform init
   terraform apply
   ```
