# Source: https://hub.docker.com/_/python
FROM python:3.9-alpine3.13

ARG packages
ARG user=ref
ARG uid=1005
ARG gid=1006

RUN apk --update add ${packages} && rm -rf /var/cache/apk/*
RUN apk add --no-cache bash git openssl ca-certificates vim htop curl

# installation of pipenv via pip3 needs to be this high up so it does not fail.
RUN pip3 install pipenv
# setup timezone
RUN tz="UTC" && echo "Setting timezone to ${tz}..." && \
    ln -s -n -f "/usr/share/zoneinfo/${tz}" /etc/localtime && \
    echo "${tz}" > /etc/timezone

# Build Context from docker-compose allows for relative path to Pipfiles.
WORKDIR /rcnet
VOLUME /storage
COPY Pipfile /rcnet/
COPY Pipfile.lock /rcnet/

# Use user inside container as well.
RUN addgroup $user -g $gid -S
RUN adduser $user -u $uid -G $user -D -S
USER $user:$user

# Python Version and installing dependencies from Pipfile.
RUN python -V
RUN pwd && ls -lah && ls -lah /home
RUN time pipenv install --deploy --ignore-pipfile

# Expose port and
EXPOSE 80
ENTRYPOINT ["sh", "docker-entrypoint.sh"]
