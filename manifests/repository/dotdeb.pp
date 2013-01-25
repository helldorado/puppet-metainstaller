class metainstaller::repository::dotdeb {
  include metainstaller::packagers::apt
  metainstaller::packagers::apt::source { 'dotdeb':
    location          => 'http://packages.dotdeb.org/',
    release           => 'squeeze',
    repos             => 'all',
    key               => '55BE302B',
    key_server        => 'subkeys.pgp.net',
#    pin               => '-10',
  }
}

###################
#
#  metainstaller::packagers::apt::source { 'dotdeb':
#    location    => 'http://packages.dotdeb.org',
#    release     => 'squeeze-php54',
#    repos       => 'all',
#    include_src => true,
#  }
#
#  exec { 'add_dotdeb_key':
#    command => 'curl --silent "http://www.dotdeb.org/dotdeb.gpg" > /tmp/dotdeb.gpg && cat /tmp/dotdeb.gpg | sudo apt-key add - && touch /var/local/dotdeb.gpg.done',
#    creates => '/var/local/dotdeb.gpg.done';
#  }
#
#  Exec['add_dotdeb_key']
#    -> Apt::Source['dotdeb']
#    ~> Exec['apt_update']
#
##}
