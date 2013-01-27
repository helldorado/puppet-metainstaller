class metainstaller::php (
  $cli_ini_content          = undef,
  $cli_ini_source           = undef,
  $php_cli_package_name     = 'php5-cli',
  $php_fpm_package_name     = 'php5-fpm',
  $php_fpm_service_name     = 'php5-fpm',
  $php_cli_dir              = "${metainstaller::params::php_dir}cli/",
  $php_cli_ini              = "${metainstaller::params::php_dir}cli/php.ini",
  $php_mod_ini              = "${metainstaller::params::php_mod_dir}php.ini",
  $php_extra_dir            = "${metainstaller::params::php_dir}extra/",
  $php_conf_dir             = "${metainstaller::params::php_dir}conf.d/",
  $php_fpm_dir              = "${metainstaller::params::php_dir}fpm/",
  $php_fpm_pool_dir         = "${metainstaller::params::php_dir}pool.d/",
  $php_fpm_ini              = "${metainstaller::params::php_fpm_dir}php.ini",
  $php_fpm_conf             = "${metainstaller::params::php_fpm_dir}php-fpm.conf"
) inherits metainstaller::params {
  include metainstaller::php::install
  include metainstaller::php::config
}
