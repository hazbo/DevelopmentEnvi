class misc {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update',
    require => Exec['preparenetworking']
  }

  exec { 'laravel-config':
    cwd => '/var',
    command => '/usr/bin/touch laravel.application.config.php',
    require => Exec['preparenetworking']
  }

  file { '/var/laravel.application.config.php':
    source => '/vagrant/provision/modules/misc/files/laravel/application/config/application.php',
    owner => 'root',
    group => 'root',
    require => Exec['laravel-config']
  }

  file { '/home/vagrant/.profile':
    source => '/vagrant/provision/modules/misc/files/.profile',
    owner => 'root',
    group => 'root',
    require => Exec['preparenetworking']
  }
}