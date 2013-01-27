class metainstaller::php::install {
  package {
    $metainstaller::php::php_cli_package:
      ensure => $::php_version;
    $metainstaller::params::php_mod_package:
      ensure  => $::php_version;
  }
  #Metainstaller::Packagers::Apt::Source['dotdeb'] -> Package[$metainstaller::php::php_cli_package]
  #Metainstaller::Packagers::Apt::Source['dotdeb'] -> Package[$metainstaller::params::php_mod_package]
  #Metainstaller::Packagers::Apt::Source['dotdeb'] ~> Exec['apt_update'] -> Package['$::php_cli_package']
  #Metainstaller::Packagers::Apt::Source['dotdeb'] ~> Exec['apt_update'] -> Package['$::php_mod_package']
}
