#!/bin/bash

# This script is used to run the migrations for the backend project.

SUERPUSER_EMAIL=${DJANGO_SUERPUSER_EMAIL:-}

cd /app/

/opt/venv/bin/python manage.py migrate --noinput
/opt/venv/bin/python manage.py collectstatic --noinput
/opt/venv/bin/python manage.py createsuperuser --noinput --email ${SUERPUSER_EMAIL} --noinput || true


