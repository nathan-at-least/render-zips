FROM debian:latest

ARG USERID

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
  git \
  python3-pip

RUN adduser --gecos '' --disabled-password --uid "$USERID" renderuser

# User software installs:
RUN su -c 'pip install --no-warn-script-location rst2html5' renderuser

COPY ./src/homedir/* /home/renderuser/
COPY ./src/bin/* /usr/local/bin/

RUN chmod ugo+x /usr/local/bin/*

USER $USERID
ENTRYPOINT ["/usr/local/bin/render-zips.sh"]
