# 🧩 2025-10-18 — Creación de la cuenta AWS

### 🗂️ Descripción
Creación y configuración inicial de la cuenta raíz de AWS destinada al proyecto **agevega.com**.  
Este paso establece la base de seguridad, control de costes y gestión para toda la infraestructura futura.

---

### ⚙️ Acciones realizadas
- Registro de una **nueva cuenta AWS** con el correo: `agevega.com@gmail.com`.  
- Selección del **plan de pago estándar (sin limitación de uso)**.  
- Activación de **autenticación multifactor (MFA)** para el usuario raíz, utilizando aplicación móvil TOTP.  
- Creación de un **presupuesto (AWS Budget)** con límite de **1 € mensual**, configurado para enviar alerta por correo al superar el importe.  
- Habilitación de la opción **“Enable IAM Access to Billing”**, permitiendo que los usuarios IAM puedan acceder a la información de facturación y costes.  

---

### 🎯 Motivo
- Establecer una **base segura y controlada** desde el primer día.  
- Garantizar visibilidad sobre los **costes y consumo**.  
- Cumplir buenas prácticas recomendadas por AWS (no usar el usuario raíz para operaciones diarias).  

---

### 🧾 Evidencias / Comentarios
- Verificado funcionamiento del **MFA raíz** mediante autenticación TOTP.  
- Presupuesto creado desde *Billing → Budgets* con notificación por email.  
- Confirmado acceso IAM a la facturación desde *Account → IAM User and Role Access to Billing Information*.  
- Correo de verificación de creación de cuenta recibido correctamente en Gmail.  

---

### 🚧 Pendiente
- Crear los primeros usuarios IAM (`admin` y `terraform`).  
- Documentar la configuración inicial de `aws configure` para el usuario `terraform`.  
- Crear bucket S3 para almacenar el estado remoto de Terraform.
