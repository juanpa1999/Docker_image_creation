cat <<EOL > Dockerfile
FROM postgres:16

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD 123
ENV POSTGRES_DB postgres

EXPOSE 5432
EOL

mv Dockerfile db


cat <<EOL > .env
DB_USER=postgres
DB_PASSWORD=123
DB_HOST=127.0.0.1
DB_PORT=5432
DB_NAME=postgres
SECRET_KEY=H7jFtR2\$eLzP*qWxa

NGROK=http://pablodevops.com
EOL

mv .env back


cat <<EOL > .env
REACT_APP_API_URL=http://pablodevops.com/api
REACT_APP_WS_BASE_URL=ws://pablodevops.com/api
EOL

mv .env front
