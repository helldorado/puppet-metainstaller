class metainstaller::packagers::apt::update {
  include metainstaller::packagers::apt::params

  exec { 'apt_update':
    command     => "${metainstaller::packagers::apt::params::provider} update",
    logoutput   => 'on_failure',
    refreshonly => true,
  }
}
