FROM alpine:latest

COPY application/ /application

WORKDIR /application

RUN apk update \
    && apk add python \
               py-gunicorn \
               py-pip \
               py-psycopg2 \
    && pip install -r trackapp/requirements.txt \
    && sed -i 's/pgdbuser/postgres/' trackapp/config.py \
    && sed -i 's/pgpassword/postgres/' trackapp/config.py \
    && sed -i 's/db/postgres/' trackapp/config.py \
    && sed -i 's/trackdb/postgres/' trackapp/config.py

EXPOSE 5000

CMD gunicorn -b 0.0.0.0:5000 wsgi:app
