FROM ubuntu
VOLUME ["/var/www"]
RUN apt-get update -y
RUN apt-get install git -y

RUN apt-get install -y openssh-server supervisor
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN echo 'root:password' |chpasswd

RUN apt-get install -y python-software-properties curl git
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get -qq update
RUN apt-get install -y nodejs
RUN npm install -g forever yo generator-keystone

RUN mkdir -p /var/www; cd /var/www; 

ADD keystone /var/www
ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /var/www

EXPOSE 22 3000
CMD ["/usr/bin/supervisord"]
