# Visualizador de Débitos - MVP

## 🧩 Requisitos

- Docker y Docker Compose
- Node.js (si frontend fuera React)
- Java 17+ (para backend con Spring Boot)

## ⚙️ Setup rápido

```bash
cd scripts
bash setup.sh
```

Accede a:

* Frontend: [http://localhost:3000](http://localhost:3000)
* Backend: [http://localhost:8080/api/health](http://localhost:8080/api/health)
* n8n: [http://localhost:5678](http://localhost:5678)

## 🔐 Variables de entorno

Copiar y configurar `.env` desde `.env.example`.

## 🚀 Flujo de unificación de movimientos

Se provee un workflow de n8n en `n8n/workflows/email-to-airtable.json`.
Este flujo se conecta por IMAP a las cuentas de notificaciones de
Santander y Prex, normaliza la información de cada correo y la
guarda en una tabla de Airtable.

Pasos para probar el MVP:

1. Completar las credenciales de IMAP y Airtable en `.env`.
2. Ejecutar `scripts/setup.sh` para levantar los servicios con Docker.
3. Importar el workflow en la instancia de n8n (`http://localhost:5678`).
