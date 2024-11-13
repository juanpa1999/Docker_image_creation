#!/bin/bash

docker compose up -d

sleep 5

docker compose run --rm alembic init alembic
docker compose run --rm back alembic upgrade head
docker compose run --rm back alembic revision --autogenerate