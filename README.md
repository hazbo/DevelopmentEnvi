# DevelopmentEnvi

Just a simple development environment using puppet manifests to install:

  - Nginx
  - PHP5 (FPM)
  - Composer
  - MySQL
  - MongoDB w/ PHP Extension

## Usage

	$ git clone https://github.com/hazbo/DevelopmentEnvi.git project
	$ cd project
	$ vagrant up

Depends on Virtualbox and Vagrant.

I'm trying to think of new ways to make setting up a development environment really easy
so you can just get on with the actual code. The current setup seems to work really well
with Laravel, so I have added a feature that pulls down the latest version, configures it
and has you up and running in seconds.

## Extras

I am currently working on some ways to automate framework creation inside the vagrant machine.
Starting with Laravel, you can now do the following to have a clean install of Laravel working
out of the box with all the configuration you need:

	$ vagrant ssh

Once inside the box:

	$ laravelinstall

That's it! In this example the port on the vagrant box mapped to `80` is `4567`. This is setup
in the Laravel `config/application.php` file, so if you change to port in the Vagrant file,
you'll need to change it in Laravel also.

### Contributing

Please feel free to contribute to this project. I'm no expert in this particular subject
myself, it's just a fun project for me to work on and I'd appreciate any of your thoughts or help.