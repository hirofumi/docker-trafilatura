FROM python:3.9.3-alpine3.13

COPY requirements.txt .

RUN apk add --no-cache --virtual .build gcc libc-dev libxml2-dev libxslt-dev \
    && apk add --no-cache libxml2 libxslt \
    && pip3 --no-cache-dir install -r requirements.txt \
    && rm requirements.txt \
    && apk del .build

ENTRYPOINT ["/usr/local/bin/trafilatura"]
