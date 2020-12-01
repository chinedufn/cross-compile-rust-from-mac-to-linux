FROM debian:buster-slim

RUN apt-get update && apt-get -y install ca-certificates libssl-dev && rm -rf /var/lib/apt/lists/*

ADD . /app
WORKDIR /app

CMD ./program
