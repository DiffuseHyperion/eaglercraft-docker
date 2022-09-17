FROM ubuntu:18.04

ENV MIN_RAM=32M
ENV MAX_RAM=32M

VOLUME /server
EXPOSE 25565

COPY update.sh /update.sh
COPY . /server

CMD /update.sh $MIN_RAM $MAX_RAM
