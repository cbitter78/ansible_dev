FROM ubuntu

MAINTAINER Charles Bitter "cbitter78@gmail.com"

# Install base os tools that are needed
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get install -y software-properties-common build-essential git ssh \
                     vim curl wget man psmisc zsh patch mysql-client sshpass

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get install -y python2.7 python2.7-dev libpython2.7-dev libssl-dev libffi-dev \
                     python-pip python-dev build-essential python-tox python-sphinx

RUN pip install --upgrade pip && pip install --upgrade virtualenv 
RUN pip install ansible netaddr 'dnspython>=1.15.0' pyghmi

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get install -y zlib1g-dev libxslt-dev libxml2-dev ruby-full

RUN gem install nokogiri -- --use-system-libraries=true --with-xml2-include=/usr/include/libxml2
RUN gem install --no-rdoc --no-ri rspec rake test-kitchen kitchen-openstack bundler

ADD vimrc /root/.vimrc
ADD run.sh /run.sh
CMD /run.sh
RUN chmod +x /run.sh