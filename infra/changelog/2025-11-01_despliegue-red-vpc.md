# 🧩 2025-11-01 — Despliegue de red (VPC, subredes y componentes base)

### 🗂️ Descripción
Despliegue del módulo `01-networking` en `infra/terraform/01-networking/`, encargado de crear la red base del entorno **agevegacom** en AWS.  
Incluye la VPC principal, subredes públicas y privadas, así como los elementos necesarios para la conectividad (Internet Gateway, tablas de rutas y etiquetado coherente).  
⚠️ **NAT Gateway pospuesto:** se documenta pero no se despliega para mantener el presupuesto mensual dentro de 5–10 €.

---

## 🌐 AWS VPC

### ⚙️ Acciones realizadas
- Creada la **VPC principal** `agevegacom-vpc` en la región **eu-south-2 (Madrid)**.  
- Bloque CIDR asignado: `10.0.0.0/16`.  
- Configuración:
  - **DNS hostnames** habilitados ✅  
  - **DNS support** habilitado ✅  
- Etiquetas aplicadas: `Name`, `Project`, `Environment`, `Owner`, `IaC`.

---

## 🧩 Subredes

### ⚙️ Acciones realizadas
- Definidas **6 subredes** distribuidas en **3 zonas de disponibilidad** (`eu-south-2a`, `eu-south-2b`, `eu-south-2c`):  
  - **3 subredes públicas** → acceso directo a Internet mediante Internet Gateway.  
  - **3 subredes privadas** → sin salida a Internet (pendiente de NAT Gateway cuando el presupuesto lo permita).  
- Bloques CIDR asignados de forma equitativa dentro del rango `10.0.0.0/16`.  
- Asociadas las subredes públicas y privadas a sus respectivas tablas de rutas.  
- Nomenclatura uniforme:  


```
public-a / private-a
public-b / private-b
public-c / private-c
```

---

## 🌐 Internet Gateway (IGW)

### ⚙️ Acciones realizadas
- Creado **Internet Gateway** `agevegacom-igw`.  
- Asociado a la VPC `agevegacom-vpc`.  
- Referenciado en la tabla de rutas pública para habilitar acceso a Internet.

---

## 🔄 Tablas de rutas


### ⚙️ Acciones realizadas
- Creada **tabla de rutas pública** con destino `0.0.0.0/0` hacia `agevegacom-igw`.  
- Creada **tabla de rutas privada** con rutas internas únicamente (sin salida a Internet de momento).  
- Asociadas las subredes correspondientes según su tipo.  
- Confirmada propagación correcta de rutas y conectividad interna.

---

## 🏷️ Etiquetado global

### ⚙️ Detalles
Aplicadas etiquetas uniformes en todos los recursos:
| Clave | Valor |
|-------|--------|
| Name | agevegacom |
| Project | agevegacom |
| Environment | dev |
| Owner | Alejandro Vega |
| IaC | Terraform |

---

### 🎯 Motivo
- Establecer la infraestructura de red base para los futuros despliegues de servicios (ECS, RDS, S3, etc.).  
- Garantizar separación lógica y física entre capas (pública, privada, base de datos).  
- Asegurar conectividad saliente controlada y cumplimiento de buenas prácticas de seguridad cuando el presupuesto permita activar NAT Gateway.

---

### 🧾 Evidencias / Comentarios
- Plan y aplicación (`terraform apply`) ejecutados correctamente desde `infra/terraform/01-networking`.  
- Todos los recursos creados con etiquetas uniformes y verificados en la consola.  
- Se dejaron instrucciones y código comentado para desplegar NAT Gateway en el futuro, pero no se aplicó en este hito.  
- Configuración compatible con futuras integraciones (VPC endpoints, peering, etc.).

---

### 💰 Coste estimado mensual

| Recurso | Estimado mensual | Notas |
|----------|------------------|-------|
| VPC + Subredes + Rutas | 0 € | Recursos sin coste directo |
| Internet Gateway | 0 € | Solo coste por transferencia |
| NAT Gateway | 0 € | No desplegado (pospuesto por presupuesto) |
| Elastic IP | 0 € | No creada |
**Total estimado:** ~0–1 €/mes

---

### 🚧 Pendiente
- [ ] Añadir **VPC Endpoints** para S3 y DynamoDB.  
- [ ] Crear **Security Groups base** para instancias públicas y privadas.  
- [ ] Re-evaluar despliegue de NAT Gateway cuando el presupuesto lo permita (añadir rutas y EIP asociada).  
- [ ] Documentar bloques `variables.tf` y `outputs.tf` del módulo `01-networking`.
