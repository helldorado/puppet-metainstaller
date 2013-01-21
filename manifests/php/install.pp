class metainstaller::php::install {
  package { $metainstaller::params::cli_package_name:
    ensure => present,
  }
}
