FROM php:8.3-fpm-alpine

ARG UID=1000
ARG GID=1000
ARG USER=chaos
ARG GROUP=chaos

ENV UID=$UID
ENV GID=$GID
ENV USER=$USER
ENV GROUP=$GROUP

WORKDIR /app

RUN apk update && \
    apk --update --no-cache add bash curl git;

RUN addgroup --gid ${GID} ${GROUP} && \
    adduser --disabled-password --ingroup ${GROUP} --uid ${UID} ${USER};

COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm"]

USER $USER