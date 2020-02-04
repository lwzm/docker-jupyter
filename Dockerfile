FROM alpine

RUN apk add --no-cache python3 py3-pyzmq \
    && pip3 install --no-cache-dir jupyter \
    && find /usr/lib/ -name '*.pyc' -delete \
    && ln -s /usr/local /root/.local

COPY etc/ /root/

VOLUME /usr/local/ /home/
WORKDIR /home/

EXPOSE 80

CMD [ "jupyter", "notebook" ]
