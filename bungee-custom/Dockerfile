FROM ubuntu:18.04

ENV MIN_RAM=32M
ENV MAX_RAM=32M

VOLUME /data
EXPOSE 25565

COPY update.sh /update.sh
COPY setup.sh /setup.sh
COPY . /data

CMD /update.sh $MIN_RAM $MAX_RAM
