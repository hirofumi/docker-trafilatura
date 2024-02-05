FROM alpine:3.19

COPY requirements.txt .

RUN apk add --no-cache --virtual .build py3-pip \
    && apk add --no-cache py3-lxml python3 \
    && pip3 --no-cache-dir install -r requirements.txt \
    && rm requirements.txt \
    && apk del .build

ENTRYPOINT ["/usr/local/bin/trafilatura"]
