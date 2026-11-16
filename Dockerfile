# Imagen base ligera de Nginx
FROM nginx:alpine

# Metadatos de trazabilidad
LABEL maintainer="Ricardo Santibañez" \
      description="Sitio estatico de reserva de horas medicas - Proyecto DevOps IACC" \
      version="1.0.0"

# Copia el sitio estático al directorio publicado por Nginx
COPY src/ /usr/share/nginx/html/

EXPOSE 80

# Comprobación de salud del contenedor
HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1
