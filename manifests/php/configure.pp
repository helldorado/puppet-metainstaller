define metainstaller::php::configure($key, $value, $sapi) {
  augeas { "php/${sapi}/${key}":
    lens  => 'php.lns',
    incl  => "/etc/php5/${sapi}/php.ini",
    changes => [
      "set '${key}' '${value}'"
    ];
  }

}
