FROM debian:latest

ARG USERID

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  git \
  python3-pip

COPY ./src/* /usr/local/bin/
RUN chmod ugo+x /usr/local/bin/*

RUN adduser --gecos '' --disabled-password --uid "$USERID" renderuser
RUN su -c 'pip install rst2html5' renderuser

USER $USERID
ENTRYPOINT ["/usr/local/bin/render-zips.sh"]
