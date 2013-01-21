class metainstaller::repository::percona {
 # include apt
  apt::source { 'percona':
    location          => 'http://repo.percona.com/apt/',
    release           => 'squeeze',
    repos             => 'main',
    key               => 'CD2EFD2A',
    key_server        => 'subkeys.pgp.net',
    pin               => '1001',
  }
}
