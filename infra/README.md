# 🧱 Infraestructura – agevega.com

Registro cronológico de la configuración y mantenimiento de la infraestructura en AWS para el proyecto **agevega.com**.

Este documento actúa como índice general de todas las operaciones y cambios realizados, con enlaces a las entradas detalladas del registro diario en la carpeta `changelog/`.

---

## 📘 Estructura del directorio

```bash
infra/
├── changelog/              # Entradas detalladas por fecha
│   ├── 2025-10-18_creacion-cuenta.md
│   └── 2025-10-18_configuracion-iam.md
│   └── 2025-10-24_auditoria-y-configuracion-logs.md
│   └── 2025-10-26_configuracion-terraform-state.md
├── terraform/              # Código IaC (futuro)
│   ├── 00-terraform-state-S3/
└── README.md               # Índice cronológico (este archivo)
```

---

## 🗓️ Cronología general

### 18/10/2025 — Creación de la cuenta AWS
- Alta de nueva cuenta AWS (`agevega.com@gmail.com`)
- Activación de plan de pago estándar
- Configuración de MFA para el usuario raíz
- Activación del acceso a **facturación y costes** para usuarios IAM
- Cambio del idioma de la consola a **English (US)**
- Configuración de la **moneda de visualización y facturación en euros (EUR)**
- Creación del presupuesto global **“My 10$ Budget”** con alertas al 10 %, 50 %, 100 % y 200 %
- Creación del presupuesto global **“My Daily 1$ Budget”** con alertas al 50 %, 100 %, 200 %, 500 % y 1000 %
➡️ [Detalles](changelog/2025-10-18_creacion-cuenta.md)

### 20/10/2025 — Configuración inicial de IAM
- Creación del usuario `admin` con acceso a la consola y permisos `AdministratorAccess`
- Creación del usuario `terraform` con acceso programático (CLI) y permisos `AdministratorAccess`  
➡️ [Detalles](changelog/2025-10-20_configuracion-iam.md)

### 24/10/2025 — Activación de auditoría y registro de configuración
- Habilitación de **AWS CloudTrail** con validación de logs y almacenamiento en S3 (`cloudtrail-logs-agevega-com`).
- Habilitación de **AWS Config** con grabación continua de todos los recursos y entrega en S3 (`aws-config-logs-agevega-com`).
➡️ [Detalles](changelog/2025-10-24_auditoria-y-configuracion-logs.md)

### 26/10/2025 — Configuración del backend remoto de Terraform (S3 + DynamoDB)
- Despliegue del código en `infra/terraform/00-terraform-state-S3` para configurar el backend remoto de Terraform.  
- Creación del **bucket S3** `terraform-state-agevega-com` en `eu-south-2` para el estado remoto.  
- Activación de **versionado**, **cifrado SSE-AES256**, **bloqueo de acceso público** y **propiedad forzada al propietario**.  
- Aplicación de política **DenyInsecureTransport** y regla de ciclo de vida con transición a **GLACIER_IR (30 d)** y **DEEP_ARCHIVE (120 d)**.  
- Creación de la **tabla DynamoDB** `terraform-state-lock` para bloqueo de estado, con **SSE**, **PITR** y **protección contra borrado** habilitados.  
➡️ [Detalles](changelog/2025-10-26_configuracion-terraform-state.md)
