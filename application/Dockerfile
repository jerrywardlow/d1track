FROM alpine:latest

COPY . /application

WORKDIR /application

RUN apk update \
    && apk add python \
               py-gunicorn \
               py-pip \
               py-psycopg2 \
    && pip install -r requirements.txt

EXPOSE 5000

CMD gunicorn -b 0.0.0.0:5000 wsgi:app
