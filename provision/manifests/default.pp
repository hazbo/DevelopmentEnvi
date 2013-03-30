stage { 'first':
	before => Stage[main]
}
stage { 'ppa':
	before => Stage['first']
}
stage { 'veryfirst':
	before => Stage['ppa']
}
stage { 'last':
	require => Stage[main]
}
group { 'puppet':
	ensure => 'present'
}
class { 'nginx':
	stage => first
}
class { 'dns':
	stage => veryfirst
}
class { 'misc':
	stage => ppa
}

class sudo {
  group { "wheel":
    ensure => "present",
  }
	
  exec { "/bin/echo \"%wheel  ALL=(ALL) ALL\" >> /etc/sudoers":
	    require => Group["wheel"]
	}
	
  user { "developer":
    ensure => "present",
    gid => "wheel",
    shell => "/bin/bash",
    home => "/home/developer",
    managehome => true,
    password => "passwordtest",
    require => Group["wheel"]
  }
}

import "dns"
include dns
import "composer"
include composer
import "nginx"
include nginx
import "php"
include php
import "mysql"
include mysql
import "mongodb"
include mongodb
include sudo