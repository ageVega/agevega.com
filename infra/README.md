# 🧱 Infraestructura – agevega.com

Documentación del proceso de creación y configuración de la infraestructura en AWS para el proyecto **agevega.com**.

---

## 📅 Cronología inicial

### 🗓️ 18/10/2025 — Creación de la cuenta AWS
- Se crea una **cuenta nueva en AWS** con el correo:  
  `agevega.com@gmail.com`  
- Se elige el **plan de pago estándar (no free tier limitado)**.  
- Se configura **autenticación multifactor (MFA)** para el usuario raíz.  

---

### ⚙️ Configuración inicial de seguridad y costes
- Se crea un **presupuesto (Budget)** con alerta al superar **1 € de gasto mensual**.  
- Se habilita el acceso a la **facturación** para usuarios no raíz (IAM).  

---

### 👤 Creación de usuarios IAM
#### Usuario `admin`
- Acceso: **Consola de administración AWS**.  
- Política asignada: `AdministratorAccess`.  
- Propósito: administración general y gestión del entorno.  

#### Usuario `terraform`
- Acceso: **Programático (Access Key + Secret Key)**.  
- Política asignada: `AdministratorAccess` (temporal, pendiente de refinar).  
- Propósito: despliegue y gestión de infraestructura mediante **Terraform CLI**.  

---

### 🔐 Estado de seguridad actual
- ✅ MFA activo para el usuario raíz.  
- ✅ Acceso a facturación habilitado para IAM.  
- ⚠️ Pendiente: crear políticas personalizadas para `terraform`.  
- ⚠️ Pendiente: configurar backend remoto para Terraform (S3 + DynamoDB).  

---

## 📘 Próximos pasos previstos
- [ ] Crear estructura base de Terraform (`main.tf`, `backend.tf`, etc.).  
- [ ] Configurar bucket S3 para hosting de `agevega.com`.  
- [ ] Generar certificado SSL en ACM.  
- [ ] Configurar distribución CloudFront.  
- [ ] Vincular dominio `agevega.com` desde Route 53.  
- [ ] Documentar cada etapa en este archivo.  

---

## 🧭 Notas
- Este `README.md` sirve como **registro cronológico** de los cambios realizados en la infraestructura.  
- Cada modificación relevante (usuarios, políticas, servicios, módulos Terraform, etc.) debe documentarse con fecha.  
