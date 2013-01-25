class metainstaller::php::install {
  package {
    '$::php_cli_package':
      ensure => $::php_version;
    '$::php_fpm_or_mod':
      ensure  => $::php_version;
  }

  Metainstaller::Packagers::Apt::Source['dotdeb'] ~> Exec['apt_update'] -> Package['$::php_cli_package']
  Metainstaller::Packagers::Apt::Source['dotdeb'] ~> Exec['apt_update'] -> Package['$::php_fpm_or_mod']

}
