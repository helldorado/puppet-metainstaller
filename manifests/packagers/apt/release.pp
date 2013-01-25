# release.pp

class metainstaller::packagers::apt::release (
  $release_id
) {

  include metainstaller::packagers::apt::params

  $root = $metainstaller::packagers::apt::params::root

  file { "${root}/apt.conf.d/01release":
    owner   => root,
    group   => root,
    mode    => '0644',
    content => "APT::Default-Release \"${release_id}\";"
  }
}
