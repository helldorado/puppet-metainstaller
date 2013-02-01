define metainstaller::php::sapi($value) {

  $notify = [

  ]

  $require = [
    Package['$::php_cli_package']
  ]

  metainstaller::php::configure { "${::sapi}/${name}":
    sapi    => '$::sapi',
    notify  => $notify,
    require => $require,
    key     => $name,    value   => $value;
  }
}
