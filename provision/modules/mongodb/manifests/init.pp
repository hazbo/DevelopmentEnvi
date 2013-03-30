class mongodb {
  package { "mongodb":
    ensure => present,
    require => Package[php5-fpm]
  }

  exec{ "install-mongo-extension":
    command => "/usr/bin/pecl install mongo",
    require => Package[mongodb]
  }

  exec{ "append-mongo-ini":
    command => "/bin/echo 'extension=mongo.so' >> /etc/php5/fpm/php.ini",
    require => Exec['install-mongo-extension']
  }

  exec{ "reload-php5-fpm":
    command => "/etc/init.d/php5-fpm reload",
    require => Exec['append-mongo-ini']
  }
}