# 📸 Guía para Añadir Imágenes al README

## 🔧 Cómo añadir imágenes a tu repositorio

### Método 1: Subir imágenes a GitHub directamente
1. Ve al repositorio en GitHub.com
2. Navega a la carpeta `docs/images/`
3. Arrastra y suelta tus imágenes o usa "Add file" > "Upload files"
4. Commit los cambios

### Método 2: Usar la línea de comandos
```bash
# Copia tus imágenes a la carpeta docs/images/
cp /ruta/a/tu/imagen.png docs/images/

# Añade los archivos al control de versiones
git add docs/images/

# Commit los cambios
git commit -m "Añadir imágenes de documentación"

# Push al repositorio
git push origin main
```

## 📝 Imágenes sugeridas para el README

### Capturas de pantalla recomendadas:
1. **dashboard.png** - Vista principal del dashboard
2. **mascotas.png** - Interfaz de gestión de mascotas
3. **eventos.png** - Página de eventos benéficos
4. **admin-panel.png** - Panel de administración
5. **responsive-design.png** - Vista en móvil y desktop
6. **user-flow.png** - Diagrama de flujo de usuarios

### Diagramas técnicos:
1. **arquitectura-sistema.png** - Diagrama de arquitectura GCP
2. **diagrama-er.png** - Diagrama Entidad-Relación
3. **esquema-bd.png** - Esquema detallado de la base de datos

## 🎨 Consejos para mejores imágenes

### Para capturas de pantalla:
- Usa resolución alta (1920x1080 o superior)
- Captura pantallas completas de las funcionalidades principales
- Incluye datos de ejemplo realistas
- Evita información sensible (usa datos de prueba)

### Para diagramas:
- Usa herramientas como Draw.io, Lucidchart, o Figma
- Mantén un estilo consistente
- Usa colores que contrasten bien
- Incluye leyendas cuando sea necesario

## 🖼️ Formatos recomendados
- **PNG**: Para capturas de pantalla (mejor calidad)
- **JPG**: Para fotos (menor tamaño)
- **SVG**: Para diagramas vectoriales (escalables)

## 📏 Tamaños recomendados
- **Capturas de pantalla**: 800-1200px de ancho
- **Diagramas**: 600-1000px de ancho
- **Logos**: 200-400px de ancho

## 🔗 Sintaxis Markdown para imágenes

```markdown
# Imagen básica
![Texto alternativo](docs/images/nombre-imagen.png)

# Imagen con título (tooltip)
![Texto alternativo](docs/images/nombre-imagen.png "Título de la imagen")

# Imagen con enlace
[![Texto alternativo](docs/images/nombre-imagen.png)](URL-del-enlace)

# Imagen centrada (usando HTML)
<div align="center">
  <img src="docs/images/nombre-imagen.png" alt="Texto alternativo" width="600">
</div>
```

## ✅ Checklist para imágenes

- [ ] Todas las imágenes están en la carpeta `docs/images/`
- [ ] Los nombres de archivo son descriptivos y sin espacios
- [ ] Cada imagen tiene texto alternativo apropiado
- [ ] Las imágenes son de tamaño razonable (< 1MB cada una)
- [ ] Las capturas no contienen información sensible
- [ ] Los diagramas son legibles y bien organizados
