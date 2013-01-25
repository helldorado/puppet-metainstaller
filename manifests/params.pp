class metainstaller::params {
  case $::operatingsystem {
    'Ubuntu': {
      $service_provider = upstart
    }
    default: {
      $service_provider = undef
    }
  }

  case $::osfamily {

    'Debian': {
      $config_file_source       = downcase($::osfamily)
      ## PHP global variables
      $php_base_dir             = '/etc/php5/'
      ## Apache globales variables
      $apache_base_dir          = '/etc/apache2/'
      $apache_confd             = "${base_dir}conf.d/"
      $apache_conf              = "${base_dir}apache2.conf"
      $apache_service_name      = 'apache2'
      $user                     = 'www-data'
      $group                    = 'www-data'
      $virtual_available        = "${base_dir}sites-available/"
      $virtual_active           = "${base_dir}sites-enabled/"
      $package_prefix           = 'libapache2-mod-'  ### >>> apache.pp

      ## Mysql globales var
      $basedir              = '/usr'
      $datadir              = '/var/lib/mysql'
      $service_name         = 'mysql'
      $client_package_name  = 'mysql-client'
      $server_package_name  = 'mysql-server'
      $socket               = '/var/run/mysqld/mysqld.sock'
      $pidfile              = '/var/run/mysqld/mysqld.pid'
      $config_file          = '/etc/mysql/my.cnf'
      $log_error            = '/var/log/mysql/error.log'
      $ruby_package_name    = 'libmysql-ruby'
      $python_package_name  = 'python-mysqldb'
      $php_package_name     = 'php5-mysql'
      $java_package_name    = 'libmysql-java'
      $root_group           = 'root'
      $ssl_ca               = '/etc/mysql/cacert.pem'
      $ssl_cert             = '/etc/mysql/server-cert.pem'
      $ssl_key              = '/etc/mysql/server-key.pem'

      ## Postfix globales variables
      $package              = 'postfix'
      $service              = 'postfix'
      $service_hasstatus    = true
      $service_hasrestart   = true
      $aliases              = '/etc/aliases'
      $mailname             = '/etc/mailname'
      $newaliases_cmd       = '/usr/bin/newaliases'
      $config_dir           = '/etc/postfix/'
      $master               = "${config_dir}master.cf"
      $main                 = "${config_dir}main.cf"
      $package_mailx        = 'bsd-mailx'

      # Postfixadmin globales variables
      $version              = '2.3.6'
      $url                  = "http://downloads.sourceforge.net/project/postfixadmin/postfixadmin/postfixadmin-${version}/postfixadmin_${version}-1_all.deb"
      $base_dir             = '/usr/share/postfixadmin/'
      $config_dir           = '/etc/postfixadmin/'
      $conf_file            = "${config_dir}config.inc.php"
      $apache_conf          = "${config_dir}apache.conf"

      ## Roundcube
      $version              = '0.8.4'
      $url                  = "http://garr.dl.sourceforge.net/project/roundcubemail/roundcubemail/${version}/roundcubemail-${version}.tar.gz"
      $base_dir             = '/usr/share/roundcube/'
      $config_dir           = "${base_dir}config"
      $db_config            = "${config_dir}db.inc.php"
      $main_config          = "${config_dir}main.inc.php"

      ## Dovecot globales variables 'dovecot': {
      $base_dir             = '/etc/dovecot/'
      $dovecot_conf         = "${base_dir}dovecot.conf"
      $dovecot_sieve        = "${base_dir}default.sieve"
      $dovecot_query        = "${base_dir}dovecot-mysql.conf"

    }

    'RedHat': {
      ## PHP global variables
      $config_file_source       = downcase($::osfamily)
      $base_dir             = '/etc/php5/'
      ## Apache globales variables
      $base_dir             = '/etc/apache2/'
      $apache_confd         = "${base_dir}conf.d/"
      $apache_conf          = "${base_dir}apache2.conf"
      $apache_service_name  = 'apache2'
      $user                 = 'www-data'
      $group                = 'www-data'
      $virtual_available    = "${base_dir}sites-available/"
      $virtual_active       = "${base_dir}sites-enabled/"
      $package_prefix       = 'libapache2-mod-'

      ## Mysql globales var
      $basedir              = '/usr'
      $datadir              = '/var/lib/mysql'
      $service_name         = 'mysql'
      $client_package_name  = 'mysql-client'
      $server_package_name  = 'mysql-server'
      $socket               = '/var/run/mysqld/mysqld.sock'
      $pidfile              = '/var/run/mysqld/mysqld.pid'
      $config_file          = '/etc/mysql/my.cnf'
      $log_error            = '/var/log/mysql/error.log'
      $ruby_package_name    = 'libmysql-ruby'
      $python_package_name  = 'python-mysqldb'
      $php_package_name     = 'php5-mysql'
      $java_package_name    = 'libmysql-java'
      $root_group           = 'root'
      $ssl_ca               = '/etc/mysql/cacert.pem'
      $ssl_cert             = '/etc/mysql/server-cert.pem'
      $ssl_key              = '/etc/mysql/server-key.pem'

      ## Postfix globales variables
      $package              = 'postfix'
      $service              = 'postfix'
      $service_hasstatus    = true
      $service_hasrestart   = true
      $aliases              = '/etc/aliases'
      $mailname             = '/etc/mailname'
      $newaliases_cmd       = '/usr/bin/newaliases'
      $config_dir           = '/etc/postfix/'
      $master               = "${config_dir}master.cf"
      $main                 = "${config_dir}main.cf"
      $package_mailx        = 'bsd-mailx'

      # Postfixadmin globales variables
      $version              = '2.3.6'
      $url                  = "http://downloads.sourceforge.net/project/postfixadmin/postfixadmin/postfixadmin-${version}/postfixadmin_${version}-1_all.deb"
      $base_dir             = '/usr/share/postfixadmin/'
      $config_dir           = '/etc/postfixadmin/'
      $conf_file            = "${config_dir}config.inc.php"
      $apache_conf          = "${config_dir}apache.conf"

      ## Roundcube
      $version              = '0.8.4'
      $url                  = "http://garr.dl.sourceforge.net/project/roundcubemail/roundcubemail/${version}/roundcubemail-${version}.tar.gz"
      $base_dir             = '/usr/share/roundcube/'
      $config_dir           = "${base_dir}config"
      $db_config            = "${config_dir}db.inc.php"
      $main_config          = "${config_dir}main.inc.php"

      ## Dovecot globales variables 'dovecot': {
      $base_dir             = '/etc/dovecot/'
      $dovecot_conf         = "${base_dir}dovecot.conf"
      $dovecot_sieve        = "${base_dir}default.sieve"
      $dovecot_query        = "${base_dir}dovecot-mysql.conf"

    }

    'Suse': {
      $basedir               = '/usr'
      $datadir               = '/var/lib/mysql'
      $service_name          = 'mysql'
      $client_package_name   = $::operatingsystem ? {
        /OpenSuSE/           => 'mysql-community-server-client',
        /(SLES|SLED)/        => 'mysql-client',
        }
      $server_package_name   = $::operatingsystem ? {
        /OpenSuSE/           => 'mysql-community-server',
        /(SLES|SLED)/        => 'mysql',
        }
      $socket                = $::operatingsystem ? {
        /OpenSuSE/           => '/var/run/mysql/mysql.sock',
        /(SLES|SLED)/        => '/var/lib/mysql/mysql.sock',

        }
      $pidfile               = '/var/run/mysql/mysqld.pid'
      $config_file           = '/etc/my.cnf'
      $log_error             = $::operatingsystem ? {
        /OpenSuSE/           => '/var/log/mysql/mysqld.log',
        /(SLES|SLED)/        => '/var/log/mysqld.log',
        }
      $ruby_package_name     = $::operatingsystem ? {
        /OpenSuSE/           => 'rubygem-mysql',
        /(SLES|SLED)/        => 'ruby-mysql',
        }

      $python_package_name   = 'python-mysql'
      $java_package_name     = 'mysql-connector-java'
      $root_group            = 'root'
      $ssl_ca                = '/etc/mysql/cacert.pem'
      $ssl_cert              = '/etc/mysql/server-cert.pem'
      $ssl_key               = '/etc/mysql/server-key.pem'

    }

    'FreeBSD': {
      case $application {
        'php': {
          $base_dir             = '/etc/php5/'
          $base_dir             = '/etc/apache2/'
          $apache_confd         = "${base_dir}conf.d/"
          $apache_conf          = "${base_dir}apache2.conf"
          $apache_service_name  = 'apache2'
          $user                 = 'www-data'
          $group                = 'www-data'
          $virtual_available    = "${base_dir}sites-available/"
          $virtual_active       = "${base_dir}sites-enabled/"
          $package_prefix       = 'libapache2-mod-'
        }
        'mysql': {
          $basedir               = '/usr/local'
          $datadir               = '/var/db/mysql'
          $service_name          = 'mysql-server'
          $client_package_name   = 'databases/mysql55-client'
          $server_package_name   = 'databases/mysql55-server'
          $socket                = '/tmp/mysql.sock'
          $pidfile               = '/var/db/mysql/mysql.pid'
          $config_file           = '/var/db/mysql/my.cnf'
          $log_error             = "/var/db/mysql/${::hostname}.err"
          $ruby_package_name     = 'ruby-mysql'
          $ruby_package_provider = 'gem'
          $python_package_name   = 'databases/py-MySQLdb'
          $php_package_name      = 'php5-mysql'
          $java_package_name     = 'databases/mysql-connector-java'
          $root_group            = 'wheel'
          $ssl_ca                = undef
          $ssl_cert              = undef
          $ssl_key               = undef
        }
        'postfix': {
          $package              = 'postfix'
          $service              = 'postfix'
          $service_hasstatus    = true
          $service_hasrestart   = true
          $aliases              = '/etc/aliases'
          $mailname             = '/etc/mailname'
          $newaliases_cmd       = '/usr/bin/newaliases'
          $config_dir           = '/etc/postfix/'
          $master               = "${config_dir}master.cf"
          $main                 = "${config_dir}main.cf"
          $package_mailx        = 'bsd-mailx'
        }
        'postfixadmin': {
          $version              = '2.3.6'
          $url                  = "http://downloads.sourceforge.net/project/postfixadmin/postfixadmin/postfixadmin-${version}/postfixadmin_${version}-1_all.deb"
          $base_dir             = '/usr/share/postfixadmin/'
          $config_dir           = '/etc/postfixadmin/'
          $conf_file            = "${config_dir}config.inc.php"
          $apache_conf          = "${config_dir}apache.conf"
        }
        'roundcube': {
          $version              = '0.8.4'
          $url                  = "http://garr.dl.sourceforge.net/project/roundcubemail/roundcubemail/${version}/roundcubemail-${version}.tar.gz"
          $base_dir             = '/usr/share/roundcube/'
          $config_dir           = "${base_dir}config"
          $db_config            = "${config_dir}db.inc.php"
          $main_config          = "${config_dir}main.inc.php"
        }
        'dovecot': {
          $base_dir             = '/etc/dovecot/'
          $dovecot_conf         = "${base_dir}dovecot.conf"
          $dovecot_sieve        = "${base_dir}default.sieve"
          $dovecot_query        = "${base_dir}dovecot-mysql.conf"
        }
      }
    }

   default: {
          fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat, Debian, and FreeBSD")
        }
      }
}
