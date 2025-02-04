FROM dpage/pgadmin4

# Establecer variables de entorno
ENV PGADMIN_DEFAULT_EMAIL=pablo@pablo.com
ENV PGADMIN_DEFAULT_PASSWORD=pablo
ENV PGADMIN_LISTEN_PORT=5050  # Configurar pgAdmin para que escuche en el puerto 5050

# Exponer el puerto interno 5050 (sin exponerlo al host, solo para redes internas)
EXPOSE 5050

# Comando por defecto para iniciar el contenedor
CMD ["/entrypoint.sh"]
