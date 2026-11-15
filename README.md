# Reserva de Horas Médicas - Proyecto DevOps (IACC)

Sitio web **estático** de reserva de horas médicas para la empresa ficticia *Clínica Vida Plena*,
servido con **Nginx** dentro de un contenedor **Docker** y levantado con **Docker Compose**.
No utiliza API ni base de datos.

## Estructura

```
proyecto-devops/
├── src/
│   ├── index.html
│   └── styles.css
├── Dockerfile
├── docker-compose.yml
├── .env.example
├── .gitignore
├── README.md
└── .github/workflows/devops-automation.yml
```

## Requisitos

- Git
- Docker Desktop instalado e iniciado
- Navegador web

## Instalación

```bash
git clone https://github.com/rist1694/reserva-horas-medicas-devops.git
cd reserva-horas-medicas-devops
cp .env.example .env      # en Windows (PowerShell): Copy-Item .env.example .env
```

## Ejecución

```bash
docker compose up -d --build
```

## Verificación

```bash
docker compose ps
docker ps
curl -I http://localhost:8080
docker logs reserva-horas-web
docker stats --no-stream reserva-horas-web
```

Abrir en el navegador: <http://localhost:8080>

## Detención

```bash
docker compose down
```

## Seguridad

- No se publican credenciales, tokens ni datos personales (los datos del sitio son ficticios).
- Las variables de entorno se documentan en `.env.example` (sin valores sensibles).
- El archivo `.env` real está excluido mediante `.gitignore`.
- Antes de cada commit se revisa con `git status` y `git diff --staged`.

## Flujo de trabajo Git

`main` (estable) ← `feature/*` mediante Pull Request y revisión. Commits pequeños y descriptivos.

## Automatización

El workflow `.github/workflows/devops-automation.yml` valida archivos, construye la imagen y
prueba el contenedor en cada push o Pull Request hacia `main` (sin desplegar en servidores externos).
