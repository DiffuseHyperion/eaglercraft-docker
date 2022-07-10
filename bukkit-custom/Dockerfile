FROM ubuntu:18.04

ENV MIN_RAM=512M
ENV MAX_RAM=512M
ENV ONLINE=true
ENV TYPE=lobby

VOLUME /data
EXPOSE 25565

COPY update.sh /update.sh
COPY . /data

CMD /update.sh $MIN_RAM $MAX_RAM $ONLINE $TYPE
 
