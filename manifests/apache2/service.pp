class metainstaller::apache2::service {
  service { $metainstaller::params::apache_service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['metainstaller::apache2::config'],
  }
}
