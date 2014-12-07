FROM ubuntu:14.04

WORKDIR /tmp
RUN apt-get update
RUN apt-get install -qqy git curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev ruby ruby-dev subversion
RUN git clone https://github.com/sstephenson/ruby-build.git
RUN cd ruby-build && ./install.sh
RUN gem install fpm
CMD ruby-build $RUBY_VERSION /usr/local/ruby/$RUBY_VERSION && fpm -t deb -n ruby -v $RUBY_VERSION -s dir /usr/local/ruby/$RUBY_VERSION
