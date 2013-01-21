class metainstaller::mysql::service {
  service { $metainstaller::params::mysql_service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['metainstaller::mysql::config'],
  }
}
