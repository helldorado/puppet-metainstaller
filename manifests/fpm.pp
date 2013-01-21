class metainstaller::fpm (
  $fpm_ini_content = undef,
  $fpm_ini_source = undef,
  $fpm_conf_content = undef,
  $fpm_conf_source = undef
) {
  include php
  include metainstaller::fpm::install
  include metainstaller::fpm::config
  include metainstaller::fpm::service

  Class['metainstaller::fpm::config'] ~> Class['metainstaller::fpm::service']
}
