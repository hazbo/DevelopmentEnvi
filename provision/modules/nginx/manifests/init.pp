class nginx {
  package { "nginx":
    ensure => present,
    require => Exec['apt-get update']
  }
	
  file { '/etc/nginx/sites-available/default':
    source => '/vagrant/provision/modules/nginx/files/default',
    owner => 'root',
    group => 'root',
    require => Package['nginx']
  }

  service { "nginx":
    ensure => running,
    require => Package["nginx"]
  }
}