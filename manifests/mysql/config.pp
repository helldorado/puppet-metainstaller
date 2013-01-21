class metainstaller::mysql::config {
  file { $metainstaller::params::mysql_data_dir:
    ensure  => directory,
    owner   => 'mysql',
    group   => 'mysql',
    mode    => '755',
    require => Class['metainstaller::mysql::install'],
  }

  file { $metainstaller::params::mysql_conf_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '755', 
    require => Class['metainstaller::mysql::install'],
  }

  file { $metainstaller::params::mysql_conf_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    require => Class['metainstaller::mysql::install'],
    notify  => Service[$metainstaller::params::mysql_service_name],
  }

  file { $metainstaller::params::mysql_debian_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '600',
    require => Class['metainstaller::mysql::install'],
  }

}
