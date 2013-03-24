class php {

  package { "php5":
    ensure => present,
    require => [ Exec['apt-get update'], Package[nginx] ]
  }

  package { "php5-fpm":
    ensure => present,
    require => [ Exec['apt-get update'], Package[nginx] ]
  }
  
  package { "php5-mysql":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-dev":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-curl":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-gd":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] }
  
  package { "php5-imagick":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ]
  }
  
  package { "php5-mcrypt":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-memcache":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-mhash":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-pspell":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-snmp":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-xmlrpc":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-xsl":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-cli":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php-pear":
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  exec { "phpunit":
  	command => "/usr/bin/pear upgrade pear && /usr/bin/pear config-set auto_discover 1 && /usr/bin/pear install pear.phpunit.de/PHPUnit",
  	require => Package[php-pear]
  }
  
  package{ "make":
		ensure => present,
		require => Exec['apt-get update']
	}

  exec { "reload-php-fpm":
      command => "/etc/init.d/php5-fpm reload",
      refreshonly => true,
      require => [ Exec['apt-get update'], Package[nginx], File['/etc/nginx/sites-available/default'] ]
  }
  
  exec { "reload-nginx":
      command => "/etc/init.d/nginx reload",
      refreshonly => true,
      require => [ Exec['apt-get update'], Package[nginx], File['/etc/nginx/sites-available/default'] ]
  }
}