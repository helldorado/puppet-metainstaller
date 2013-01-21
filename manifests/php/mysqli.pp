class metainstaller::php::mysql {

  package { 'php5-mysql':
    ensure => present
  }

  file {'/etc/php5/conf.d/mysqli.ini':
    ensure  => present,
    source  => 'puppet:///metainstaller/mysqli.ini'
  }

  file {'/etc/php5/conf.d/mysql.ini':
    ensure  => present,
    source  => 'puppet:///metainstaller/mysql.ini'
  }

  file {'/etc/php5/conf.d/pdo_mysql.ini':
    ensure  => present,
    source  => 'puppet:///metainstaller/pdo_mysql.ini'
  }

  file {'/etc/php5/conf.d/pdo.ini':
    ensure  => present,
    source  => 'puppet:///metainstaller/pdo.ini'
  }

}
