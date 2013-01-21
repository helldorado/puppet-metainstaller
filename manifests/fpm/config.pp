class metainstaller::fpm::config {
  file { $metainstaller::params::fpm_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
    force   => true,
    require => Class['metainstaller::fpm::install'],
    notify  => Class['metainstaller::fpm::service'],
  }

  file { "${metainstaller::params::fpm_dir}conf.d":
    ensure  => link,
    target  => '../conf.d',
    force   => true,
    require => File[$metainstaller::params::fpm_dir],
    notify  => Class['metainstaller::fpm::service'],
  }

  file { "${metainstaller::params::fpm_dir}pool.d":
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
    force   => true,
    require => Class['metainstaller::fpm::install'],
    notify  => Class['metainstaller::fpm::service'],
  }

  file { $metainstaller::params::fpm_ini:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => $metainstaller::fpm::fpm_ini_content,
    source  => $metainstaller::fpm::fpm_ini_source,
    require => Class['metainstaller::fpm::install'],
    notify  => Class['metainstaller::fpm::service'],
  }

  file { $metainstaller::params::fpm_conf:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => $metainstaller::fpm::fpm_conf_content,
    source  => $metainstaller::fpm::fpm_conf_source,
    require => Class['metainstaller::fpm::install'],
    notify  => Class['metainstaller::fpm::service'],
  }
}
