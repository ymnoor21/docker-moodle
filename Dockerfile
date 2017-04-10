FROM ubuntu:latest
MAINTAINER Yamin Noor "ymnoor21@gmail.com"

RUN echo "deb http://cn.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse" >> /etc/apt/sources.list

RUN echo "mysql-server mysql-server/root_password password foobar" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password foobar" | debconf-set-selections

RUN apt-get update && \
	apt-get -y install mysql-server-5.7 && \
	apt-get -y install supervisor && \
	mkdir -p /var/lib/mysql && \
	mkdir -p /var/run/mysqld && \
	mkdir -p /var/log/mysql && \
	chown -R mysql:mysql /var/lib/mysql && \
	chown -R mysql:mysql /var/run/mysqld && \
	chown -R mysql:mysql /var/log/mysql

ADD ./init.sh /init.sh
RUN chmod 755 /*.sh

RUN mkdir -p /etc/supervisor/conf.d
ADD ./mysql-supervisor.conf /etc/supervisor/conf.d/mysql.conf

# UTF-8 and bind-address
RUN sed -i -e "$ a [client]\n\n[mysql]\n\n[mysqld]"  /etc/mysql/my.cnf && \
	sed -i -e "s/\(\[client\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf && \
	sed -i -e "s/\(\[mysql\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf && \
	sed -i -e "s/\(\[mysqld\]\)/\1\ninit_connect='SET NAMES utf8'\ncharacter-set-server = utf8\ncollation-server=utf8_unicode_ci\nbind-address = 0.0.0.0/g" /etc/mysql/my.cnf

VOLUME ["/var/lib/mysql", "/var/log/mysql", "/var/log/supervisor"]

EXPOSE 3306

CMD ["supervisord", "-n"]