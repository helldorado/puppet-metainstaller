class metainstaller::repository::dotdeb {
  #include apt
  apt::source { 'dotdeb':
    location          => 'http://packages.dotdeb.org/',
    release           => 'squeeze',
    repos             => 'all',
    key               => '55BE302B',
    key_server        => 'subkeys.pgp.net',
#    pin               => '-10',
  }
}
