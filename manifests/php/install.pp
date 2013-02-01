class metainstaller::php::install {
  package {
    $metainstaller::php::php_cli_package:
      ensure => $::php_version;
  }
}
