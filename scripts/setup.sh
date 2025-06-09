#!/bin/bash

echo "⚙️ Iniciando setup del Visualizador de Débitos..."

# Cargar variables de entorno
if [ ! -f ../.env ]; then
  echo "❌ Falta el archivo .env. Copiando desde .env.example"
  cp ../.env.example ../.env
fi

# Build de imágenes backend y frontend
echo "🐳 Construyendo imágenes Docker..."
docker build -f ../docker/backend.Dockerfile -t visualizador-backend ../backend
docker build -f ../docker/frontend.Dockerfile -t visualizador-frontend ../frontend

# Levantar servicios
echo "🚀 Levantando servicios con docker-compose..."
docker-compose -f ../docker/docker-compose.yml up -d

# Migraciones o inicialización
echo "🛠️ Ejecutando tareas post-setup..."
docker exec visualizador-backend ./gradlew migrateDb || echo "No se corrieron migraciones"

echo "✅ Setup completado."
