class metainstaller::fpm::service {
  service { $metainstaller::params::fpm_service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['metainstaller::fpm::config'],
  }
}
