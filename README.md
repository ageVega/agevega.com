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
```
[GitHub] --(Actions)--> [S3 bucket privado]
                                 ↓
                        [CloudFront + ACM]
                                 ↓
                        [Route 53 → agevega.com]
```

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

# 2. Instalar dependencias
npm install

# 3. Ejecutar entorno de desarrollo local
npm run dev

# 4. Generar build de producción
npm run build
```
> El contenido compilado en /dist se desplegará automáticamente en S3 mediante GitHub Actions.

---

## ⚙️ Despliegue e infraestructura (resumen)

La infraestructura estará definida en `infra/` utilizando **Terraform**.

**Recursos principales**
- Bucket **S3** (hosting estático, origen privado).
- **CloudFront Distribution** (CDN + HTTPS con ACM).
- **ACM Certificate** (validado vía DNS en Route 53).
- Registros **DNS** en Route 53 (apuntando a CloudFront).

**CI/CD (resumen)**
1. GitHub Actions ejecuta el build con Astro.  
2. Los artefactos (`/dist`) se sincronizan al bucket S3 (origen privado).  
3. Se crea una invalidación de CloudFront para propagar el contenido actualizado.  
4. Logs y métricas: CloudFront y (si aplica) Lambda en CloudWatch; logs S3 opcionales en bucket de logging.

**Notas de seguridad / configuración recomendada**
- Usar **Origin Access Control (OAC)** para que CloudFront acceda al bucket S3 privado.  
- Forzar HTTPS y redirigir HTTP a HTTPS en CloudFront.  
- Configurar headers de seguridad: `Strict-Transport-Security`, `Content-Security-Policy`, `X-Content-Type-Options`, `Referrer-Policy`.  
- Lifecycle policy para logs y objetos obsoletos en buckets S3.  
- Gestionar secretos con **GitHub Secrets** o **AWS Secrets Manager** (nunca en el repo).  
- Considerar **AWS WAF** con reglas gestionadas si el tráfico lo justifica.

---

## ✅ Buenas prácticas y estándares

- Código tipado con **TypeScript** y linting consistente (**ESLint + Prettier**).  
- Accesibilidad (**WCAG AA**) y rendimiento como prioridades.  
- Diseño **responsive-first** con TailwindCSS.  
- Revisiones PR, pruebas en CI y versionado semántico.  
- Dependabot y escaneo de vulnerabilidades en CI (fail on critical/high).

---

## 🧪 Testing y calidad (placeholder)

- Pipeline CI: lint + typecheck + build.  
- Añadir en próximas iteraciones: unit tests (Vitest), E2E (Playwright).  
- Checks obligatorios en PR: `npm run lint`, `npm run build`, `npm test` (cuando estén disponibles).

---

## 🛣️ Roadmap inicial
- [x] Elegir stack tecnológico definitivo  
- [x] Configurar dominio y DNS en Route 53  
- [ ] Inicializar proyecto Astro con TypeScript + TailwindCSS  
- [ ] Crear infraestructura base (Terraform: S3 + CloudFront + ACM + Route 53)  
- [ ] Configurar CI/CD con GitHub Actions  
- [ ] Maquetar la landing page inicial (hero, servicios, contacto)  
- [ ] Añadir analítica y metadatos SEO  
- [ ] Implementar formulario de contacto (API Gateway + Lambda + SES)

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
