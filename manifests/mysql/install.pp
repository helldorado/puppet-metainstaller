class metainstaller::mysql::install {
 package { $metainstaller::params::mysql_package_name:
    ensure  => present,
    notify  => Service[$metainstaller::params::mysql_service_name],
  }
}
