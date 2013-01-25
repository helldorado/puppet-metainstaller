# builddep.pp

define metainstaller::packagers::apt::builddep() {
  include metainstaller::packagers::apt::update

  exec { "apt-builddep-${name}":
    command   => "/usr/bin/apt-get -y --force-yes build-dep ${name}",
    logoutput => 'on_failure',
    notify    => Exec['apt_update'],
  }

  # Need anchor to provide containment for dependencies.
  anchor { "metainstaller::packagers::apt::builddep::${name}":
    require => Class['metainstaller::packagers::apt::update'],
  }
}
