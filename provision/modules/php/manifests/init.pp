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
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-dev":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-curl":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-gd":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] }
  
  package { "php5-imagick":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ]
  }
  
  package { "php5-mcrypt":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-memcache":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-mhash":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-pspell":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-snmp":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-xmlrpc":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-xsl":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php5-cli":
    notify => Exec["reload-php-fpm"],
    ensure => present, 
    require => [ Exec['apt-get update'], Package[nginx] ] 
  }
  
  package { "php-pear":
    notify => Exec["reload-php-fpm"],
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