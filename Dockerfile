FROM itzg/minecraft-server:latest

ENV AWSCLI_VERSION "1.14.10"

ADD backup-data-to-s3.sh /backup-data-to-s3.sh
ADD start.sh /start.sh

RUN chmod +x /backup-data-to-s3.sh
RUN chmod +x /start.sh

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    && pip install awscli==$AWSCLI_VERSION --upgrade --user \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*



ENTRYPOINT [ "/start.sh" ]
