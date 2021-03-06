# DevelopmentEnvi

Just a simple development environment using puppet manifests to install:

  - Nginx
  - PHP5 (FPM)
  - Composer
  - MySQL w/ PHP Extension
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

Now allows you to install frameworks out of the box, that work with this setup very well.
To do so for either `Laravel` or `Code Igniter` you can ssh into your new box:

	$ vagrant ssh

And run the following commands:

  - For Laravel

		$ laravelinstall

  - For Code Igniter

		$ codeigniterinstall

Once you have done that, (in this example with our Vagrantfile forwarding port `80` to `4567`) all you
need to do is locate to `http://localhost:4567` in your browser. Done!

For `Laravel`, there is a configuration file located at `/vagrant/src/public/application/config/application.php` which already has the pre-configured URL
using port `4567`. If you need to change this in your Vagrant setup, you may need to do so here too.

### Todo:

  - Improve directory structure for different types of configuration files that are for frameworks or applications ect..
  - Automate the way frameworks are installed and configured with a database.
  - Add more PHP frameworks e.g. Symfony, CI, Yii ect..
  - Once user first SSHd into the box, remove a lock file that will not prompt with initial configuration options.

### Contributing

Please feel free to contribute to this project. I'm no expert in this particular subject
myself, it's just a fun project for me to work on and I'd appreciate any of your thoughts or help.