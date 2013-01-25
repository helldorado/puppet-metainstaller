define metainstaller::packagers::apt::conf (
  $content,
  $ensure   = present,
  $priority = '50'
) {

  include metainstaller::packagers::apt::params

  $apt_conf_d = $metainstaller::packagers::apt::params::apt_conf_d

  file { "${apt_conf_d}/${priority}${name}":
    ensure  => $ensure,
    content => $content,
    owner   => root,
    group   => root,
    mode    => '0644',
  }
}
