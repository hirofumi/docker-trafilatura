FROM alpine:3.19

COPY requirements.txt .

RUN apk add --no-cache --virtual .build py3-pip \
    && apk add --no-cache pipx python3 \
    && pipx install trafilatura \
    && pipx runpip trafilatura install -r requirements.txt \
    && rm requirements.txt \
    && apk del .build

ENV PATH="/root/.local/bin:${PATH}"

ENTRYPOINT ["/root/.local/bin/trafilatura"]
