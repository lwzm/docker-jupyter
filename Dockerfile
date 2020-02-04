FROM alpine

ARG HOME=/root

RUN apk add --no-cache python3 py3-pyzmq \
    && pip3 install --no-cache-dir jupyter \
    && find /usr/lib/ -name '*.pyc' -delete \
    && ln -s /usr/local $HOME/.local

COPY etc/ $HOME/

VOLUME /usr/local
WORKDIR /home/

EXPOSE 80

CMD [ "jupyter", "notebook" ]
