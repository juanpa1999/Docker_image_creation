# Etapa 1: Construcción de la aplicación React
FROM node:18-alpine AS build

WORKDIR /usr/src/app

# Instala dependencias antes de copiar el resto del código para aprovechar la caché
COPY package*.json ./
RUN npm install --frozen-lockfile

# Ahora copia el código fuente de la app
COPY . .

# Crea el build de la aplicación
RUN npm run build

# Etapa 2: Copia de los archivos construidos a una imagen Nginx
FROM nginx:alpine

# Elimina EXPOSE ya que el puerto es manejado por nginx-proxy
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# El CMD predeterminado de Nginx ya está configurado, no es necesario especificarlo de nuevo
