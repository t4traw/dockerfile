﻿FROM ubuntu:14.04
MAINTAINER t4traw <t4traw@gmail.com>
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y && apt-get -y install build-essential curl git-core libcurl4-openssl-dev libreadline-dev libssl-dev libxml2-dev libxslt1-dev libyaml-dev zlib1g-dev
RUN curl -O http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
RUN tar -zxvf ruby-2.1.2.tar.gz
RUN cd ruby-2.1.2
RUN ./configure --disable-install-doc
RUN make
RUN make install
RUN cd ..
RUN rm -r ruby-2.1.2 ruby-2.1.2.tar.gz
RUN echo 'gem: --no-document' > /usr/local/etc/gemrc
RUN gem install bundler --no-rdoc --no-ri