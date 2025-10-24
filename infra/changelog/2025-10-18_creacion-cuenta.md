
---

### 📄 **`infra/changelog/2025-10-18_creacion-cuenta.md`**

```markdown
# 🧩 2025-10-18 — Creación de la cuenta AWS

### 🗂️ Descripción
Se crea una nueva cuenta de AWS para el proyecto **agevega.com**, que alojará la infraestructura del sitio y los servicios asociados.

---

### ⚙️ Acciones realizadas
- Registro de la cuenta con el correo: `agevega.com@gmail.com`
- Selección del **plan de pago estándar**
- Activación de **MFA (autenticación multifactor)** para el usuario raíz
- Creación de un **budget de 1 €** con alerta por correo en caso de superar el importe
- Activación de la opción **“Enable IAM Access to Billing”**, permitiendo acceso a facturación a usuarios no raíz

---

### 🎯 Motivo
Establecer una base segura desde el primer día:
- Protección de la cuenta raíz con MFA  
- Control inmediato de costes y facturación  
- Preparación del entorno para gestión mediante usuarios IAM  

---

### 🧾 Evidencias / Comentarios
- MFA configurado mediante aplicación móvil (TOTP).  
- Presupuesto visible en AWS Budgets → Budget name: `budget-1eur`.  
- Opción de facturación habilitada desde *Account → IAM User and Role Access to Billing Information*.  

---

### 🚧 Pendiente
- Crear usuarios IAM (`admin` y `terraform`).  
- Definir política personalizada para `terraform`.  
