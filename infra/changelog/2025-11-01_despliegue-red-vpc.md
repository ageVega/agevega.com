# 🧩 2025-11-01 — Despliegue de red (VPC, subredes y componentes base)

### 🗂️ Descripción
Despliegue del módulo `01-networking` en `infra/terraform/01-networking/`, encargado de crear la red base del entorno **agevega.com** en AWS.  
Incluye la VPC principal, subredes públicas, privadas y de bases de datos, así como los elementos necesarios para la conectividad (Internet Gateway, NAT Gateway, tablas de rutas y etiquetas coherentes).

---

## 🌐 AWS VPC

### ⚙️ Acciones realizadas
- Creada la **VPC principal** `agevega-vpc` en la región **eu-south-2 (Madrid)**.  
- Bloque CIDR asignado: `10.0.0.0/16`.  
- Configuración:
  - **DNS hostnames** habilitados ✅  
  - **DNS support** habilitado ✅  
- Etiquetas aplicadas: `Name`, `Project`, `Environment`, `Owner`, `IaC`.

---

---

## 🧩 Subredes

### ⚙️ Acciones realizadas
- Definidas **9 subredes** distribuidas en **3 zonas de disponibilidad** (`eu-south-2a`, `eu-south-2b`, `eu-south-2c`):  
  - **3 subredes públicas** → acceso directo a Internet mediante Internet Gateway.  
  - **3 subredes privadas** → conectividad saliente a través de NAT Gateway.  
  - **3 subredes de base de datos** → sin acceso a Internet, solo tráfico interno.  
- Bloques CIDR asignados de forma equitativa dentro del rango `10.0.0.0/16`.  
- Asociadas las subredes públicas y privadas a sus respectivas tablas de rutas.  
- Nomenclatura uniforme:  


```
public-a / private-a / db-a
public-b / private-b / db-b
public-c / private-c / db-c
```

---

## 🌐 Internet Gateway (IGW)

### ⚙️ Acciones realizadas
- Creado **Internet Gateway** `agevega-igw`.  
- Asociado a la VPC `agevega-vpc`.  
- Referenciado en la tabla de rutas pública para habilitar acceso a Internet.

---

## 🔄 Tablas de rutas


### ⚙️ Acciones realizadas
- Creada **tabla de rutas pública** con destino `0.0.0.0/0` hacia `agevega-igw`.  
- Creada **tabla de rutas privada** con destino `0.0.0.0/0` hacia NAT Gateway.  
- Asociadas las subredes correspondientes según su tipo.  
- Confirmada propagación correcta de rutas y conectividad interna.

---

## ⚡ NAT Gateway

### ⚙️ Acciones realizadas
- Desplegado **NAT Gateway** en la subred pública `public-a`.  
- Asignada **Elastic IP** dedicada.  
- Asociada a la tabla de rutas privada para permitir salida a Internet de instancias privadas.  
- Confirmada accesibilidad y correcta asociación tras despliegue.

---

## 🏷️ Etiquetado global

### ⚙️ Detalles
Aplicadas etiquetas uniformes en todos los recursos:
| Clave | Valor |
|-------|--------|
| Name | agevega.com |
| Project | agevega.com |
| Environment | dev |
| Owner | Alejandro Vega |
| IaC | Terraform |

---

### 🎯 Motivo
- Establecer la infraestructura de red base para los futuros despliegues de servicios (ECS, RDS, S3, etc.).  
- Garantizar separación lógica y física entre capas (pública, privada, base de datos).  
- Asegurar conectividad saliente controlada y cumplimiento de buenas prácticas de seguridad.

---

### 🧾 Evidencias / Comentarios
- Plan y aplicación (`terraform apply`) ejecutados correctamente desde `infra/terraform/01-networking`.  
- Todos los recursos creados con etiquetas uniformes y verificados en la consola.  
- NAT Gateway operativo y confirmada salida a Internet desde subred privada (test EC2).  
- Configuración compatible con futuras integraciones (VPC endpoints, peering, etc.).

---

### 💰 Coste estimado mensual

| Recurso | Estimado mensual | Notas |
|----------|------------------|-------|
| VPC + Subredes + Rutas | 0 € | Recursos sin coste directo |
| Internet Gateway | 0 € | Solo coste por transferencia |
| NAT Gateway | ~33 € | Coste base + tráfico saliente |
| Elastic IP | 0 € | Asociada permanentemente |
**Total estimado:** ~33–35 €/mes

---

### 🚧 Pendiente
- [ ] Añadir **VPC Endpoints** para S3 y DynamoDB.  
- [ ] Crear **Security Groups base** para instancias públicas y privadas.  
- [ ] Evaluar si se requiere NAT Gateway adicional en zonas B y C para alta disponibilidad.  
- [ ] Documentar bloques `variables.tf` y `outputs.tf` del módulo `01-networking`.
