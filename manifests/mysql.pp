class metainstaller::mysql {
  include metainstaller
  include metainstaller::mysql::install
  include metainstaller::mysql::config
  include metainstaller::mysql::service
  include metainstaller::mysql::postinstall
}
