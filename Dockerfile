FROM alpine
LABEL maintainer="lwzm@qq.com"

RUN apk add --no-cache python3 py3-pyzmq \
    && pip3 install --no-cache-dir jupyter \
    && ln -s /usr/local /root/.local \
    && cd /usr/lib/python3* \
    && python3 -O -m compileall -q -b -f . \
    && find . -name __pycache__ | xargs rm -rf \
    && find . -name '*.py' -delete

COPY etc/ /root/

VOLUME /usr/local/ /home/
WORKDIR /home/

ENV PASSWORD=""
EXPOSE 80

CMD [ "jupyter", "notebook" ]
