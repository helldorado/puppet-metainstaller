define metainstaller::php::module(
  $ensure         = present,
  $package_prefix = 'php5-',
  $source         = undef,
  $content        = undef,
  $require        = undef,
  $notify         = undef
) {
  include metainstaller::php
  include metainstaller::repository::dotdeb
#  include apt
  $file_name = "${name}.ini"

  if $require {
    $real_require = [
      Class['metainstaller::php::install'],
      $require,
    ]
  } else {
    $real_require = Class['metainstaller::php::install']
  }

  if $real_notify {
    $real_notify = [
      Class['metainstaller::pĥp:ini::${name}']

    ]
  }
  package { "php-${name}":
    ensure  => $ensure,
    name    => "${package_prefix}${name}",
    require => $real_require,
  }

  $source_real = $source ? {
    undef   => undef,
    true    => [
      "puppet:///files/${::fqdn}/etc/php5/conf.d/${file_name}",
      "puppet:///files/etc/php5/conf.d/${file_name}",
      "puppet:///files/${::hostgroup}/etc/php5/conf.d/${file_name}",
      "puppet:///files/${::domain}/etc/php5/conf.d/${file_name}",
      "puppet:///modules/metainstaller/etc/php5/conf.d/${file_name}",
      "puppet:///files/etc/php5/conf.d/${file_name}",
      "puppet:///metainstaller/files/etc/php5/conf.d/${file_name}",
      "puppet:///metainstaller/${file_name}",
      "puppet:///etc/php5/conf.d/${file_name}",
      "puppet:///etc/php5/conf.d/${file_name}",
      "puppet:///modules/metainstaller/${file_name}",
      "/etc/puppet/modules/metainstaller/files/etc/php5/conf.d/${file_name}",
      "puppet:///modules/metainstaller/${file_name}",
    ],
    default => $source,
  }

  $content_real = $content ? {
    undef   => undef,
    default => template("${content}${file_name}.erb"),
  }

  file { $file_name:
    ensure  => $ensure,
    path    => "${::php_conf_dir}${file_name}",
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => $notify,
    source  => $source_real,
    content => $content_real,
    require => [
      Class['metainstaller::php'],
      Package["php5-${name}"],
    ],
  }

}
