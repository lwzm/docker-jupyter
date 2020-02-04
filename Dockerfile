FROM alpine

RUN apk add --no-cache python3 py3-pyzmq \
    && pip3 install --no-cache-dir jupyter \
    && find /usr/lib/ -name '*.pyc' -delete

ARG HOME=/root

COPY etc/ $HOME/

VOLUME $HOME/.local/
WORKDIR /home/

ENV PATH="$HOME/.local/bin:$PATH"
EXPOSE 80

CMD [ "jupyter", "notebook" ]
