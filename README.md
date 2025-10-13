# 🌐 agevega.com

Repositorio del sitio web personal y landing page profesional de **Alejandro Vega**.

Este proyecto tiene como objetivo centralizar mi presencia profesional online, presentar mi portfolio y facilitar el contacto a través de un sitio web moderno, optimizado y desplegado en AWS.

---

## 📖 Índice
1. [Descripción](#-descripción)
2. [Características](#-características)
3. [Stack Tecnológico](#-stack-tecnológico)
4. [Arquitectura del Proyecto](#-arquitectura-del-proyecto)
5. [Despliegue e Infraestructura](#-despliegue-e-infraestructura)
6. [Instalación y Uso Local](#-instalación-y-uso-local)
7. [Estructura del Repositorio](#-estructura-del-repositorio)
8. [Roadmap](#-roadmap)
9. [Contribución](#-contribución)
10. [Licencia](#-licencia)
11. [Autor y Contacto](#-autor-y-contacto)

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
Tecnologías principales y herramientas empleadas en el desarrollo.  
*(A definir en futuras versiones).*

---

## 🏗️ Arquitectura del Proyecto

### 🧱 Frontend
Interfaz del sitio web desarrollada con **Astro** y **TailwindCSS**, generada como contenido estático optimizado en tiempo de build.  
El resultado se publica como HTML, CSS y JS listos para distribución global mediante CDN.

### ⚙️ Backend
Actualmente el sitio no incluye un backend propio.  
Las posibles funciones dinámicas futuras (formularios, métricas, integraciones) se implementarán mediante **servicios serverless** o APIs externas, manteniendo el enfoque de sitio estático.

### 🔄 Automatización y Entrega
Los procesos de construcción, validación y despliegue se orquestan mediante **GitHub Actions**, garantizando un flujo automatizado desde el commit hasta la publicación del contenido.  

---

## ⚙️ Despliegue e Infraestructura

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

---

## 📬 Autor y Contacto

**Alejandro Vega**  
🌐 [agevega.com](https://agevega.com) · 💼 [LinkedIn](https://www.linkedin.com/in/alejandro-vega94/) · ✉️ [agevega@gmail.com](mailto:agevega@gmail.com)