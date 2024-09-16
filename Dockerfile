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

COPY --from=tianon/gosu /gosu /usr/local/bin/

RUN apk update && \
    apk --update --no-cache add bash curl git nginx supervisor;

RUN addgroup --gid ${GID} ${GROUP} && \
    adduser --disabled-password --ingroup ${GROUP} --uid ${UID} ${USER};

COPY --link supervisor-consumers.ini /etc/supervisor.d/supervisor-consumers.ini

COPY entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

RUN chown -R $USER:$USER .

ENTRYPOINT ["/entrypoint.sh"]
