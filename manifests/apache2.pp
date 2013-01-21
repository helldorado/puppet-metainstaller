class metainstaller::apache2 (
  $apache2_ini_content = undef,
  $apache2_ini_source = undef
) inherits metainstaller::params {
#  require metainstaller::apache2::apache

  include metainstaller::php
  include metainstaller::apache2::install
#  include metainstaller::apache2::module
  include metainstaller::modules::php
  include metainstaller::apache2::config
  include metainstaller::apache2::service

# Class['metainstaller::apache2::config'] ~> Service[$metainstaller::params::apache_service_name]
  Class['metainstaller::apache2::config'] ~> Class['metainstaller::apache2::service']
}
