FROM alpine
LABEL maintainer="lwzm@qq.com"

RUN apk add --no-cache py3-pyzmq py3-argon2-cffi py3-cffi \
    && python3 -m ensurepip \
    && pip3 install --no-cache-dir jupyter \
    && ln -s /usr/local /root/.local \
    && cd /usr/lib/python3* \
    && rm -r ensurepip \
    && python3 -O -m compileall -q -b -f . \
    && find . -name __pycache__ | xargs rm -rf \
    && find . -name '*.py' -delete

VOLUME /usr/local/ /home/
WORKDIR /home/

EXPOSE 80

CMD [ "jupyter", "notebook" ]

COPY etc/ /root/
