# DevelopmentEnvi

Just a simple development environment using puppet manifests to install:

  - Nginx
  - PHP5 (FPM)
  - MySQL
  - MongoDB

## Usage

	$ git clone https://github.com/hazbo/DevelopmentEnvi.git project
	$ cd project
	$ vagrant up

Depends on Virtualbox and Vagrant.

### Todo:

Needs to run `/etc/init.d/php5-fpm reload` after extensions have been installed.

Remove any extra unused packages.