FROM debian:latest

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  git

COPY ./src/* /usr/local/bin/
RUN chmod u+x -v /usr/local/bin/*

ENTRYPOINT ["/usr/local/bin/render-zips.sh"]
