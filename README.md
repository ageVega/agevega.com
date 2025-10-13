# 🌐 agevega.com

Repositorio del sitio web personal y landing page profesional de **Alejandro Vega**.

Este proyecto tiene como objetivo centralizar mi presencia profesional online, presentar mi portfolio y facilitar el contacto a través de un sitio web moderno, optimizado y desplegado en AWS.

---

## 📖 Índice
1. [Descripción](#-descripción)
2. [Características](#-características)
3. [Stack Tecnológico](#-stack-tecnológico)
4. [Arquitectura del Proyecto](#-arquitectura-del-proyecto)
5. [Instalación y Uso Local](#-instalación-y-uso-local)
6. [Estructura del Repositorio](#-estructura-del-repositorio)
7. [Roadmap](#-roadmap)
8. [Contribución](#-contribución)
9. [Licencia](#-licencia)
10. [Autor y Contacto](#-autor-y-contacto)

---

## 🧩 Descripción

Este proyecto consiste en una **landing page profesional** diseñada para:
- Presentar mi **portfolio y trayectoria** en ingeniería DevSecOps.  
- Reunir enlaces relevantes a mis proyectos, perfiles y contactos.  
- Servir como **base centralizada** para mi identidad profesional online.  

Desarrollado con enfoque en **optimización, rendimiento, mantenimiento sencillo y automatización del despliegue mediante AWS y Terraform.**

---

## ✨ Características
Secciones visibles del sitio web.  
*(A definir en futuras versiones).*

---

## 🧱 Stack Tecnológico

Listado de las principales tecnologías y herramientas que se utilizarán en el proyecto:

### Frontend
- **Astro** — Framework estático moderno basado en componentes.  
- **TailwindCSS** — Librería de utilidades CSS para diseño rápido y responsive.  
- **TypeScript** — Tipado estático para un desarrollo más seguro y mantenible.  
- **Markdown/MDX** — Contenido estructurado y fácil de editar.  

### Backend
- **AWS Lambda (Node.js)** — Ejecución serverless para funcionalidades puntuales.  
- **API Gateway** — Puerta de enlace para exponer funciones Lambda. *(uso futuro)*  

### CI/CD y Automatización
- **GitHub Actions** — Orquestación de los pipelines de build, test y deploy.  
- **OIDC** — Autenticación segura de GitHub en AWS sin uso de claves estáticas.  

### Infraestructura
- **AWS S3** — Hosting del sitio estático.  
- **AWS CloudFront** — CDN para distribución global y caching.  
- **AWS Route 53** — Gestión de dominio y DNS.  
- **AWS Certificate Manager (ACM)** — Certificados SSL/TLS.  
- **Terraform** — Infraestructura como código (IaC) para definir y versionar recursos.

---

## 🏗️ Arquitectura del Proyecto

El proyecto se organiza en varias capas que cubren desde la interfaz de usuario hasta la automatización del despliegue y la infraestructura en la nube.

### Frontend
Interfaz del sitio web desarrollada con **Astro** y **TailwindCSS**, generada como contenido estático optimizado en tiempo de build.  
El resultado se publica como HTML, CSS y JS listos para distribución global mediante CDN.

### Backend
Actualmente el sitio no incluye un backend propio, ya que todo el contenido se sirve de forma estática.  
En futuras versiones se añadirá un **formulario de contacto** mediante **AWS API Gateway** y **Lambda (Node.js)**, manteniendo el enfoque serverless y de bajo coste.

### Automatización y Entrega
Los procesos de construcción, validación y despliegue se orquestan mediante **GitHub Actions**, garantizando un flujo automatizado desde el commit hasta la publicación del contenido.  

### Despliegue e Infraestructura
El sitio web se desplegará en **AWS**, utilizando **Terraform** como herramienta de infraestructura como código para definir y mantener los recursos necesarios.

### Elementos previstos
- **Hosting**: Amazon S3 (contenido estático).  
- **CDN**: Amazon CloudFront para distribución global y caching.  
- **Dominio**: gestionado mediante Amazon Route 53 (`agevega.com`).  
- **Certificados SSL**: emitidos y renovados automáticamente con AWS Certificate Manager (ACM).  
- **Infraestructura como código (IaC)**: todo el despliegue y configuración definidos en Terraform.  
- **Automatización**: integración futura con GitHub Actions para ejecutar los despliegues.  

> 🧩 La configuración detallada y los módulos de Terraform se documentarán una vez implementados.

---

## 💻 Instalación y Uso Local

Guía básica para ejecutar el proyecto en entorno local.  
*(Los pasos se completarán una vez definido el stack de desarrollo).*

### Requisitos previos
- Node.js LTS (versión a definir)
- Gestor de paquetes (npm, pnpm o yarn)

### Pasos iniciales
```bash
# 1. Clonar el repositorio
git clone https://github.com/agevega/agevega.com.git
cd agevega.com

# 2. Instalar dependencias
# (se especificará el gestor en futuras versiones)
npm install

# 3. Ejecutar en modo desarrollo
npm run dev
```
> 🧩 Las instrucciones se actualizarán conforme avance el desarrollo del entorno y se definan los comandos oficiales.

---

## 📁 Estructura del Repositorio
```
agevega.com/
├── src/        # Código fuente (componentes, layouts, páginas)
├── public/     # Recursos estáticos (favicons, imágenes, fuentes)
├── infra/      # Infraestructura como código (Terraform)
├── scripts/    # Scripts auxiliares (build, deploy, utilidades)
├── .gitignore
├── LICENSE
└── README.md
```
> 🧩 La estructura puede ampliarse conforme el proyecto evolucione (tests, workflows, configuración de CI/CD, etc.).

---

## 🚀 Roadmap

Plan de desarrollo y evolución del proyecto:

- [x] **Definición del README.md** con la estructura base del repositorio.  
- [ ] **Definición del stack tecnológico** y primeros archivos de configuración.  
- [ ] **Diseño inicial** de la landing page (estructura y secciones principales).  
- [ ] **Configuración del entorno local** de desarrollo.  
- [ ] **Infraestructura base** para despliegue en AWS (S3, CloudFront, Route 53).  
- [ ] **Automatización del despliegue** mediante Terraform y GitHub Actions.  
- [ ] **Publicación de la versión inicial** en `agevega.com`.

> 🧭 El roadmap puede evolucionar conforme avance el desarrollo y se definan nuevas funcionalidades o necesidades.

---

## 🤝 Contribución

Este es un proyecto personal y actualmente no está abierto a contribuciones externas.  
Si en el futuro se habilita la colaboración, se documentará el proceso y las pautas correspondientes en esta sección.

---

## 📄 Licencia

Este proyecto se distribuye bajo la licencia [MIT](./LICENSE).  
Puedes consultar los términos completos en el archivo `LICENSE`.

> ⚖️ Algunas dependencias del proyecto podrían estar sujetas a sus propias licencias. Consulta sus respectivos repositorios para más información.

---

## 📬 Autor y Contacto

**Alejandro Vega**  
🌐 [agevega.com](https://agevega.com) · 💼 [LinkedIn](https://www.linkedin.com/in/alejandro-vega94/) · ✉️ [agevega@gmail.com](mailto:agevega@gmail.com)