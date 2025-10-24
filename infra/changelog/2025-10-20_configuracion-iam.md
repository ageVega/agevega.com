# 🧩 2025-10-20 — Configuración inicial de IAM

### 🗂️ Descripción
Configuración de identidades y accesos iniciales (IAM) en la cuenta AWS recién creada.  
Objetivo: establecer un control de acceso seguro y segmentado entre el usuario administrador y el usuario técnico para Terraform.

---

### ⚙️ Acciones realizadas

#### 👤 Usuario `admin`
- Creado desde la consola AWS bajo *IAM → Users → Create user*.  
- Nombre: `admin`.  
- Se habilitó **acceso a la consola de administración AWS**.  
- Contraseña inicial autogenerada (almacenada de forma segura).  
- Política asignada: **`AdministratorAccess`**.  
- Confirmado acceso a la consola.  
- Verificado que el usuario puede visualizar y gestionar la **facturación**, gracias a la configuración previa de acceso IAM a Billing.  

#### 🤖 Usuario `terraform`
- Creado desde *IAM → Users → Create user*.  
- Nombre: `terraform`.  
- Acceso: **solo programático (CLI)**, sin acceso a la consola.  
- Política asignada: **`AdministratorAccess`** *(temporal, pendiente de restricción futura)*.  
- Generadas **Access Keys** (Access Key ID y Secret Access Key).  
- Claves almacenadas en lugar seguro para configuración posterior del proveedor Terraform.  

---

### 🎯 Motivo
Separar funciones de administración humana y automatización:
- `admin` → gestión global de la infraestructura y consola.  
- `terraform` → uso exclusivo por herramientas de IaC (Terraform, CLI, CI/CD).  

Además:
- Evitar el uso del usuario raíz.  
- Facilitar el control y la trazabilidad de operaciones.  

---

### 🧾 Evidencias / Comentarios
- Ambos usuarios creados correctamente y visibles en *IAM → Users*.  
- Confirmado acceso a la consola con `admin`.  
- Confirmada recepción de las claves de `terraform` (no expuestas públicamente).  
- Claves configuradas posteriormente en entorno local mediante `aws configure` (pendiente de documentar).  

---

### 🚧 Pendiente
- Crear **policy personalizada** con permisos limitados para `terraform` (en lugar de `AdministratorAccess`).  
- Configurar **backend remoto de Terraform** (S3 + DynamoDB).  
- Registrar configuración inicial de AWS CLI y Terraform en próxima entrada del changelog.
