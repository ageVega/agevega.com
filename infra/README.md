# 🧱 Infraestructura – agevega.com

Registro cronológico de la configuración y mantenimiento de la infraestructura en AWS para el proyecto **agevega.com**.

Este documento actúa como índice general de todas las operaciones y cambios realizados, con enlaces a las entradas detalladas del registro diario en la carpeta `changelog/`.

---

## 🗓️ Cronología general

### 18/10/2025 — Creación de la cuenta AWS
- Alta de nueva cuenta AWS (`agevega.com@gmail.com`)
- Activación de plan de pago estándar
- Configuración de MFA para el usuario raíz
- Creación de presupuesto (budget) con alerta de **1 €**
- Activación del acceso a **facturación y costes** para usuarios IAM  
➡️ [Detalles](changelog/2025-10-18_creacion-cuenta.md)

### 18/10/2025 — Configuración inicial de IAM
- Creación del usuario `admin` con acceso a la consola y permisos `AdministratorAccess`
- Creación del usuario `terraform` con acceso programático (CLI) y permisos `AdministratorAccess`  
➡️ [Detalles](changelog/2025-10-18_configuracion-iam.md)

---

## 📘 Estructura del directorio

```bash
infra/
├── changelog/              # Entradas detalladas por fecha
│   ├── 2025-10-18_creacion-cuenta.md
│   └── 2025-10-18_configuracion-iam.md
├── terraform/              # Código IaC (futuro)
└── README.md               # Índice cronológico (este archivo)
