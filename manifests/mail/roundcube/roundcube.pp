class metainstaller::roundcube (
  $roundcube_ini_content = undef,
  $roundcube_source = undef,
  $roundcube_content = undef
) {
  include php
  include metainstaller::roundcube::install
  include metainstaller::roundcube::config
  include metainstaller::roundcube::service

  Class['metainstaller::roundcube::config'] ~> Class['metainstaller::roundcube::service']
}
