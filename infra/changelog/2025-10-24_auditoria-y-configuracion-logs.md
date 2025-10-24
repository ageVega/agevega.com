# 🧩 2025-10-24 — Activación de auditoría y registro de configuración (CloudTrail + AWS Config)

### 🗂️ Descripción
Se habilitan los servicios **AWS CloudTrail** y **AWS Config** para registrar toda la actividad y los cambios de configuración dentro de la cuenta AWS (`agevega.com@gmail.com`).  
Con esta configuración, el entorno queda preparado para auditoría completa, trazabilidad de eventos y control de configuración en tiempo real.

---

## 🧾 AWS CloudTrail

### ⚙️ Acciones realizadas
- Creado un **Trail multirregional** con nombre:  
  `agevega.com-trail`
- Región principal: **eu-south-2 (España)**.
- Activado registro de eventos en **todas las regiones**.
- Bucket S3 asociado:  
  `cloudtrail-logs-agevega.com`
- Configuración de seguridad:
  - Bloqueo de acceso público ✅  
  - ACLs deshabilitadas ✅  
  - Cifrado SSE-S3 activo ✅  
- Activada la **validación de archivos de registro** para garantizar la integridad de los logs.  
- Confirmado envío de archivos al bucket:  
  `s3://cloudtrail-logs-agevega.com/AWSLogs/332327025453/`
- No configuradas notificaciones SNS ni integración con CloudWatch Logs (pendiente de definir si se requerirá alertado en tiempo real).

---

### 🎯 Motivo
- Registrar todas las acciones ejecutadas por usuarios o servicios dentro de la cuenta.  
- Garantizar trazabilidad total y auditoría de seguridad.  
- Cumplir las mejores prácticas de gobierno recomendadas por AWS.

---

### 🧾 Evidencias / Comentarios
- ARN del trail:  
  `arn:aws:cloudtrail:eu-south-2:332327025453:trail/agevega.com-trail`
- Estado: **Enabled**
- Validación de archivos: **Enabled**
- Última entrega de logs confirmada en el bucket S3.
- Sin errores reportados en consola.

---

### 💰 Coste estimado CloudTrail
| Concepto | Estimado mensual |
|-----------|------------------|
| CloudTrail (1 trail gratuito) | 0 € |
| Almacenamiento S3 (logs) | ~0,05 € |
| Validación de archivos | 0 € |
**Total aproximado:** < 0,10 €/mes

---

## 🧩 AWS Config

### ⚙️ Acciones realizadas
- Servicio habilitado en la región **eu-south-2 (España)**.
- Grabación configurada en modo **continuo** para **todos los tipos de recursos (236 detectados)**.  
- Activada la opción **incluir recursos globales** (IAM, CloudFront, etc.).  
- Bucket S3 de entrega creado:  
  `aws-config-logs-agevega.com`
- Propiedades del bucket:
  - Bloqueo de acceso público ✅  
  - ACLs deshabilitadas ✅  
  - Cifrado SSE-S3 por defecto ✅  
- Rol de servicio generado automáticamente:  
  `AWSServiceRoleForConfig`
- Retención de datos: **7 años** (valor predeterminado).  
- Sin reglas de configuración activas (aún).  
- Sin notificaciones SNS (pendiente de evaluar alertado).  
- Confirmada primera entrega de datos al bucket S3.

---

### 🎯 Motivo
- Registrar el estado y la evolución de los recursos en AWS.  
- Detectar cambios no planificados y mantener histórico de configuraciones.  
- Asegurar visibilidad continua de la infraestructura para auditoría o investigación futura.

---

### 🧾 Evidencias / Comentarios
- Grabación activa (`Recording: ON`).  
- Carpeta de entrega inicial creada:  
  `s3://aws-config-logs-agevega.com/AWSLogs/332327025453/Config/eu-south-2/`  
- Rol IAM `AWSServiceRoleForConfig` visible y operativo.  
- Sin errores ni advertencias en la consola AWS Config.

---

### 💰 Coste estimado AWS Config
| Concepto | Estimado mensual |
|-----------|------------------|
| Grabación de configuración (~200 recursos) | ~0,55 € |
| Almacenamiento S3 (snapshots JSON) | ~0,05 € |
| Reglas de evaluación (0 activas) | 0 € |
**Total aproximado:** ~0,60 €/mes

---

## 📊 Resumen general

| Servicio | Estado | Región | Bucket | Coste estimado |
|-----------|--------|--------|--------|----------------|
| **CloudTrail** | Activo + Validación ON | eu-south-2 | `cloudtrail-logs-agevega.com` | ~0,05 € |
| **AWS Config** | Activo + Retención 7 años | eu-south-2 | `aws-config-logs-agevega.com` | ~0,60 € |

**Coste total estimado mensual:** ~0,65 €  
✅ Dentro del límite de presupuesto de **1 €** configurado en AWS Budgets.

---

### 🚧 Pendiente
- [ ] Crear reglas AWS Config básicas (ej. `s3-bucket-public-read-prohibited`).  
- [ ] Vincular SNS para alertas de Config y CloudTrail (opcional).  
- [ ] Evaluar cifrado SSE-KMS para ambos buckets en el futuro.  
- [ ] Considerar reducción de retención de Config a 1 año para optimizar costes.
