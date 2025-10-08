# 🌐 agevega.com

Repositorio del sitio web personal de **Alejandro Vega (agevega.com)**.  
Este proyecto utiliza **Astro**, **TypeScript** y **TailwindCSS**, con despliegue automatizado en **AWS** a través de **S3**, **CloudFront** y **Route 53**.

---

## 🧱 Stack tecnológico (2025)

- **Framework:** [Astro](https://astro.build/)  
- **Lenguaje:** TypeScript  
- **Estilos:** TailwindCSS  
- **Infraestructura:** Terraform (IaC)  
- **Despliegue:** GitHub Actions + AWS S3 + CloudFront  
- **DNS y SSL:** Route 53 + AWS Certificate Manager (ACM)

---

## 📁 Estructura prevista del proyecto

agevega.com/
├── src/ # Código fuente principal (componentes, layouts, páginas)
│ ├── components/
│ ├── layouts/
│ ├── pages/
│ └── styles/
├── public/ # Recursos estáticos (favicon, imágenes, fuentes)
├── infra/ # Código Terraform (S3, CloudFront, ACM, Route 53)
├── scripts/ # Scripts de despliegue o utilidades
├── .github/
│ └── workflows/ # Pipelines CI/CD con GitHub Actions
├── package.json
├── astro.config.mjs
├── tsconfig.json
└── README.md

yaml
Copiar código

---

## 🚀 Despliegue en AWS

1. **Infraestructura:**  
   - Configurada mediante **Terraform** en la carpeta `infra/`.  
   - Incluye:
     - Bucket S3 con `website hosting`
     - Distribución CloudFront con certificado SSL de ACM
     - DNS gestionado desde Route 53

2. **CI/CD:**  
   - GitHub Actions compila Astro y sincroniza el contenido en S3.  
   - CloudFront se invalida automáticamente tras cada despliegue.

3. **Branch principal:** `main`

---

## 🧩 Comandos básicos

```bash
# Instalar dependencias
npm install

# Ejecutar entorno de desarrollo
npm run dev

# Generar build de producción
npm run build

# Previsualizar build localmente
npm run preview
🛠️ Tareas futuras
 Crear infraestructura base con Terraform

 Añadir pipeline de CI/CD en GitHub Actions

 Integrar analítica (por ejemplo, Plausible o Google Analytics)

 Optimizar SEO y metadatos

 Añadir modo oscuro y soporte multiidioma

📄 Licencia
Este proyecto está licenciado bajo la MIT License — ver el archivo LICENSE para más detalles.

✨ Autor
Alejandro Vega
🌍 https://agevega.com
📧 contacto@agevega.com