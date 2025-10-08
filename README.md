# 🌐 agevega.com

Repositorio del sitio web personal y landing page profesional de **Alejandro Vega**.

---

## 🧱 Stack tecnológico

**Stack seleccionado:**
- **Framework:** [Astro](https://astro.build/)  
- **Lenguaje:** TypeScript  
- **Estilos:** TailwindCSS  
- **Infraestructura:** AWS (S3 + CloudFront + ACM + Route 53)  
- **Automatización:** Terraform (IaC)  
- **CI/CD:** GitHub Actions  

**Arquitectura resumida:**

[GitHub] --(Actions)--> [S3 bucket privado]
↓
[CloudFront + ACM]
↓
[Route 53 → agevega.com]

- **S3:** almacenamiento del sitio estático generado por Astro.  
- **CloudFront:** CDN + HTTPS (certificado gestionado por ACM).  
- **Route 53:** DNS y dominio principal.  
- **Terraform:** despliegue y configuración completa de la infraestructura.  
- **GitHub Actions:** build, sync a S3 y invalidación automática de CloudFront.  

> El **formulario de contacto (API Gateway + Lambda + SES)** se implementará más adelante, en una **fase posterior**.

---

## 📁 Estructura prevista del repositorio
```
agevega.com/
├── src/ # Código fuente (componentes, layouts, páginas)
│ ├── components/
│ ├── layouts/
│ ├── pages/
│ └── styles/
├── public/ # Recursos estáticos (favicons, imágenes, fuentes)
├── infra/ # Infraestructura como código (Terraform)
├── scripts/ # Scripts auxiliares (build, deploy, utilidades)
├── .github/workflows/ # Pipelines CI/CD (GitHub Actions)
├── package.json
└── README.md
```

---

## 🚀 Puesta en marcha (placeholder)

```bash
# 1. Clonar el repositorio
git clone https://github.com/agevega/agevega.com.git
cd agevega.com
```

---

## ⚙️ Despliegue e infraestructura (resumen)

Infraestructura: definida en infra/ usando Terraform.

Recursos principales:

Bucket S3 (hosting estático, origen privado).

CloudFront Distribution (CDN + HTTPS con ACM).

ACM Certificate (validado vía DNS en Route 53).

Registros DNS en Route 53 (apuntando a CloudFront).

CI/CD:

GitHub Actions ejecuta el build con Astro.

Sincroniza artefactos al bucket S3.

Invalida la caché de CloudFront al finalizar.

---

## ✅ Buenas prácticas y estándares
Código tipado con TypeScript y linting consistente (ESLint + Prettier).

Accesibilidad (WCAG AA) y rendimiento como prioridades principales.

Diseño responsive-first con TailwindCSS.

Despliegues automatizados y versionado semántico.

Configuración segura de AWS (S3 privado + OAC + HTTPS forzado + headers de seguridad).

---

## 🧪 Testing y calidad (placeholder)
Se añadirán herramientas de testing (Playwright, Vitest o similar) en fases posteriores.

---

## 🛣️ Roadmap inicial
 Elegir stack tecnológico definitivo.

 Configurar dominio y DNS en Route 53.

 Inicializar proyecto Astro con TypeScript + TailwindCSS.

 Crear infraestructura base (Terraform: S3 + CloudFront + ACM + Route 53).

 Configurar CI/CD con GitHub Actions.

 Maquetar la landing page inicial (hero, servicios, contacto).

 Añadir analítica y metadatos SEO.

 Implementar formulario de contacto (fase posterior con API Gateway + Lambda + SES).

---

## 🤝 Contribución
Proyecto personal y cerrado en esta fase.
Se documentará el proceso de contribución en caso de abrirlo a colaboradores externos.

---

## 📄 Licencia
Pendiente de confirmación (MIT sugerida).
Se añadirá archivo LICENSE cuando se defina oficialmente.

---

## ✨ Autor
**Alejandro Vega**  
🌍 [https://agevega.com](https://agevega.com)  
📧 agevega@gmail.com

---

> _Este README se irá completando conforme tomemos decisiones sobre el stack y la implementación._
