#!/bin/bash

# Import the MySQL GPG key
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022

# Download the MySQL community release package
wget http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm

# Install the MySQL community release package
sudo yum localinstall -y mysql57-community-release-el7-8.noarch.rpm

# Install MySQL server
sudo yum install -y mysql-community-server

# Start MySQL service
sudo systemctl start mysqld

# Enable MySQL service to start on boot
sudo systemctl enable mysqld