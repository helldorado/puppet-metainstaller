class metainstaller::fpm::install {
  package { $metainstaller::params::fpm_package_name:
    ensure  => present,
    require => Class['php'],
  }
}
