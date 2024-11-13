#!/bin/bash

# Define el nombre del contenedor y la imagen de Jenkins que no quieres eliminar
CONTAINER_NAME="jenkins-blueocean"
IMAGE_NAME="jenkis-jenkins-blueocean"

# Eliminar todos los contenedores excepto el de Jenkins
for container_id in $(docker ps -aq); do
    container_name=$(docker inspect --format="{{.Name}}" "$container_id" | sed 's/^\/\(.*\)/\1/')
    if [ "$container_name" != "$CONTAINER_NAME" ]; then
        docker rm -f "$container_id"
        echo "Contenedor eliminado: $container_name"
    fi
done

sleep 1
echo "Contenedores eliminados, excepto $CONTAINER_NAME"
docker ps -a
sleep 1

# Eliminar todas las imágenes excepto la de Jenkins
for image_id in $(docker images -q); do
    image_name=$(docker inspect --format="{{.RepoTags}}" "$image_id" | sed 's/[][]//g' | awk -F: '{print $1}')
    if [ "$image_name" != "$IMAGE_NAME" ]; then
        docker rmi -f "$image_id"
        echo "Imagen eliminada: $image_name"
    fi
done

sleep 1
echo "Imágenes eliminadas, excepto $IMAGE_NAME"
docker images
sleep 1
