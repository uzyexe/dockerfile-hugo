FROM alpine:3.2

ENV HUGO_VERSION=0.14
ENV HUGO_ARCH amd64
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux_${HUGO_ARCH}

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux_${HUGO_ARCH}.tar.gz /

RUN apk add --update git perl && \
    rm -rf /var/cache/apk/*

RUN tar xvzf /${HUGO_BINARY}.tar.gz ${HUGO_BINARY}/${HUGO_BINARY} && \
    rm /${HUGO_BINARY}.tar.gz && \
    mv /${HUGO_BINARY}/${HUGO_BINARY} /usr/local/bin/hugo && \
    mkdir -p /home/hugo /www && \
    adduser -S -s /bin/sh -u 5000 -G nobody -D -h /home/hugo hugo && \
    chown hugo /www /usr/local/bin/hugo && \
    /usr/local/bin/hugo new site /www

USER hugo
WORKDIR /www

ENTRYPOINT ["/usr/local/bin/hugo"]

CMD ["help"]

EXPOSE 1313
