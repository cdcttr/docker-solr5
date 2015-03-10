FROM cdcttr/docker-ubuntu-oracle-java8

ENV SOLR_VERSION 5.0.0
ENV SOLR solr-$SOLR_VERSION
RUN export DEBIAN_FRONTEND=noninteractive && \
  mkdir -p /opt && \
  curl -o/opt/$SOLR.tgz https://dist.apache.org/repos/dist/release/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
  tar -C /opt --extract --file /opt/$SOLR.tgz && \
  rm /opt/$SOLR.tgz && \
  ln -s /opt/$SOLR /opt/solr

EXPOSE 8983
CMD ["/bin/bash", "-c", "/opt/solr/bin/solr -f"]
