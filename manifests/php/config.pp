class metainstaller::php::config {
  file { $metainstaller::params::extra_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
    force   => true,
    require => Class['metainstaller::php::install'],
  }

  file { $metainstaller::params::conf_dir_php5:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
    force   => true,
    require => Class['metainstaller::php::install'],
  }

  file { $metainstaller::params::cli_ini:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => $metainstaller::cli_ini_content,
    source  => $metainstaller::cli_ini_source,
    require => Class['metainstaller::php::install'],
  }

  file { $metainstaller::params::cli_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
    force   => true,
    require => Class['metainstaller::php::install'],
  }

  file { "${metainstaller::params::cli_dir}conf.d":
    ensure  => link,
    target  => '../conf.d',
    force   => true,
    require => File[$metainstaller::params::cli_dir],
  }
}
