FROM python:3.9-alpine3.13
LABEL maintainer="Erick B. Okal"

ENV PYTHONUNBUFFERED 1

COPY . /app
WORKDIR /app

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-deps \
    build-base postgresql-dev musl-dev
RUN /opt/venv/bin/pip install -r requirements.txt
RUN apk del .tmp-build-deps && \
    rm -rf /tmp

RUN chmod +x entrypoint.sh

CMD ["/app/entrypoint.sh"]