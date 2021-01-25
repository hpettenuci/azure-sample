FROM python:3-alpine

RUN apk update --no-cache \
    && apk add  git gcc g++ curl \
    && rm -rf /tmp/* /var/tmp/*

WORKDIR /usr/src/app

EXPOSE 5000

COPY src ./

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "./main.py" ]