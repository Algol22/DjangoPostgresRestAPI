FROM python:3.9-alpine

WORKDIR /app

COPY . .

RUN apk update && \
    apk add --no-cache postgresql-libs && \
    apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
    apk del .build-deps && \
    pip install --no-cache-dir Django djangorestframework django-cors-headers psycopg2-binary

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
