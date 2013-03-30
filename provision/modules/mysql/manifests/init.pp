class mysql {
  package { "mysql-server":
    ensure => present,
    require => [ Exec['apt-get update'], Package[php5-mysql] ]
  }
  
  package { "mysql-client":
    ensure => present,
    require => [ Exec['apt-get update'], Package[php5-mysql] ]
  }
  
  package { "libmysqlclient15-dev":
    ensure => present,
    require => [ Exec['apt-get update'], Package[php5-mysql] ]
  }
}