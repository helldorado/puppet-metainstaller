define metainstaller::php::cli::config($value) {

  $notify = [

  ]

  $require = [
    Package['$::php_cli_package']
  ]

  metainstaller::php::configure { "cli/${name}":
    sapi    => 'cli',
    notify  => $notify,
    require => $require,
    key     => $name,
    value   => $value;
  }
}

