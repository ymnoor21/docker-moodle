#!/bin/bash

# create moodle database
mysql --user=root --password=foobar -e "CREATE DATABASE IF NOT EXISTS \`moodle\` CHARACTER SET utf8 COLLATE utf8_general_ci; FLUSH PRIVILEGES;"

# create moodle user
mysql --user=root --password=foobar -e "GRANT ALL PRIVILEGES ON \`moodle\`.* TO 'moodle'@'%' IDENTIFIED BY 'moodle' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# install sudo
apt-get install -y sudo

# install vim
sudo apt-get install -y vim

# install extra softwares
sudo apt-get install -y software-properties-common python-software-properties

# add php5.6 repo
sudo LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php

# get latest updates; since we've just added a repo
sudo apt-get -y update

# install apache
sudo apt-get install -y apache2

# install ufw
sudo apt-get install -y ufw

# set ufw permission
sudo ufw allow in "Apache Full"

# install related php5.6 and extra modules
sudo apt-get install -y php5.6 libapache2-mod-php5.6 php5.6-curl php5.6-gd \
	php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml php5.6-xmlrpc

# Additional moodle package
sudo apt-get install -y graphviz aspell php5.6-pspell php5.6-curl php5.6-gd \
	php5.6-intl php5.6-mysql php5.6-xmlrpc php5.6-zip php5.6-soap php5.6-ldap clamav

# Install git
sudo apt-get install -y git-core

# Delete the file
sudo rm /etc/apache2/mods-enabled/dir.conf

# Output this into the dir.conf file
echo "
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
" >> /etc/apache2/mods-enabled/dir.conf

# Delete the file
sudo rm /etc/apache2/sites-available/000-default.conf

# Output virtual host configuration
echo "
Listen 8080

<VirtualHost *:8080>
   	ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" >> /etc/apache2/sites-available/000-default.conf

# Enable site configuration
sudo a2ensite 000-default

# cd into home
cd /home

# clone moodle
sudo git clone git://git.moodle.org/moodle.git

# enter moodle directory
cd moodle

# track the latest branch
sudo git branch --track MOODLE_32_STABLE origin/MOODLE_32_STABLE

# checkout the latest branch
sudo git checkout MOODLE_32_STABLE

# copy the moodle directory to web root
sudo cp -R /home/moodle /var/www/html/

# remember this directory; you will need this later
sudo mkdir /var/moodledata

# change ownership to www-data
sudo chown -R www-data /var/moodledata

# change permission
sudo chmod -R 777 /var/moodledata

# change permission
sudo chmod -R 0777 /var/www/html/moodle

# Restart apache2
sudo service apache2 restart
