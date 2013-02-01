class metainstaller::php::config {
  file { $metainstaller::php::php_extra_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
    force   => true,
    require => Class['metainstaller::php::install'],
  }

  file { $metainstaller::php::php_conf_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
    force   => true,
    require => Class['metainstaller::php::install'],
  }

  file { $metainstaller::php::php_cli_ini:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    require => Class['metainstaller::php::install'],
    notify  => Class['metainstaller::php::ini::sapi(sapi => cli)'],
  }

  file { $metainstaller::php::php_cli_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    purge   => true,
    recurse => true,
    force   => true,
    require => Class['metainstaller::php::install'],
  }

  file { "${metainstaller::php::php_cli_dir}conf.d":
    ensure  => link,
    target  => '../conf.d',
    force   => true,
    require => File['$metainstaller::php::php_cli_dir'],
  }

}
