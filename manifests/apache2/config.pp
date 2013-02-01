class metainstaller::apache2::config {
  file { $metainstaller::params::apache_base_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
    force   => true,
    require => Class['metainstaller::apache2::install'],
    notify  => Service[$metainstaller::params::apache_service_name],
  }

  file { "${metainstaller::params::apache_base_dir}conf.d":
    ensure  => link,
    target  => '../conf.d',
    force   => true,
    require => File[$metainstaller::params::apache_base_dir],
    notify  => Service[$metainstaller::params::apache_service_name],
  }

  file { $metainstaller::params::php_mod_ini:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    require => Class['metainstaller::apache2::install'],
    notify  => Service[$metainstaller::params::apache_service_name],
    content => $metainstaller::apache2::apache2_ini_content,
    source  => $metainstaller::apache2::apache2_ini_source,
  }
}
