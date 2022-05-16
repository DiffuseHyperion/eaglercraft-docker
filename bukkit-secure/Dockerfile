FROM ubuntu:18.04

ENV MIN_RAM=512M
ENV MAX_RAM=512M

VOLUME /data
EXPOSE 25565

COPY update.sh /update.sh
COPY . /data

CMD /update.sh $MIN_RAM $MAX_RAM

