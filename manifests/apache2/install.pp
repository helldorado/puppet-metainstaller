class metainstaller::apache2::install {
  package { $metainstaller::params::apache_package_name:
    ensure  => present,
    notify  => Service[$metainstaller::params::apache_service_name],
  }
}
