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
      $config_file_source         = downcase($::osfamily)
      $packager                   = 'apt'
      ## PHP global variables
      $php_dir                    = '/etc/php5/'
      $php_mod_dir                = '${php_base_dir}apache2'
      $php_fpm_dir                = '${php_base_dir}'
      ## Apache globales variables
      $apache_base_dir            = '/etc/apache2/'
      $apache_confd               = "${apache_base_dir}conf.d/"
      $apache_conf                = "${apache_base_dir}apache2.conf"
      $apache_service_name        = 'apache2'
      $apache_user                = 'www-data'
      $apache_group               = 'www-data'
      $virtual_available          = "${apache_base_dir}sites-available/"
      $virtual_active             = "${apache_base_dir}sites-enabled/"

      ## Mysql globales var
      $mysql_basedir              = '/usr'
      $mysql_datadir              = '/var/lib/mysql'
      $mysql_service_name         = 'mysql'
      $mysql_client_package_name  = 'mysql-client'
      $mysql_server_package_name  = 'mysql-server'
      $mysql_socket               = '/var/run/mysqld/mysqld.sock'
      $mysql_pidfile              = '/var/run/mysqld/mysqld.pid'
      $mysql_config_file          = '/etc/mysql/my.cnf'
      $mysql_log_error            = '/var/log/mysql/error.log'
      $mysql_ruby_package_name    = 'libmysql-ruby'
      $mysql_python_package_name  = 'python-mysqldb'
      $mysql_php_package_name     = 'php5-mysql'
      $mysql_java_package_name    = 'libmysql-java'
      $mysql_root_group           = 'root'
      $mysql_ssl_ca               = '/etc/mysql/cacert.pem'
      $mysql_ssl_cert             = '/etc/mysql/server-cert.pem'
      $mysql_ssl_key              = '/etc/mysql/server-key.pem'

      ## Postfix globales variables
      $postfix_config_dir         = '/etc/postfix/'
      $postfix_package            = 'postfix'
      $postfix_service            = 'postfix'
      $postfix_service_hasstatus  = true
      $postfix_service_hasrestart = true
      $postfix_aliases            = '/etc/aliases'
      $postfix_mailname           = '/etc/mailname'
      $postfix_newaliases_cmd     = '/usr/bin/newaliases'
      $postfix_master_cf          = "${postfix_config_dir}master.cf"
      $postfix_main_cf            = "${postfix_config_dir}main.cf"
      $package_mailx              = 'bsd-mailx'

      # Postfixadmin globales variables
      $pfa_version                = '2.3.6'
      $pfa_url                    = "http://downloads.sourceforge.net/project/postfixadmin/postfixadmin/postfixadmin-${pfa_version}/postfixadmin_${pfa_version}-1_all.deb"
      $pfa_base_dir               = '/usr/share/postfixadmin/'
      $pfa_config_dir             = '/etc/postfixadmin/'
      $pfa_conf_file              = "${pfa_config_dir}config.inc.php"
      $pfa_apache_conf            = "${pfa_config_dir}apache.conf"

      ## Roundcube
      $rc_version                 = '0.8.4'
      $rc_url                     = "http://garr.dl.sourceforge.net/project/roundcubemail/roundcubemail/${rc_version}/roundcubemail-${rc_version}.tar.gz"
      $rc_base_dir                = '/usr/share/roundcube/'
      $rc_config_dir              = "${rc_base_dir}config"
      $rc_db_config               = "${rc_config_dir}db.inc.php"
      $rc_main_config             = "${rc_config_dir}main.inc.php"

      ## Dovecot globales variables 'dovecot': {
      $dovecot_base_dir           = '/etc/dovecot/'
      $dovecot_conf               = "${dovecot_base_dir}dovecot.conf"
      $dovecot_sieve              = "${dovecot_base_dir}default.sieve"
      $dovecot_query              = "${dovecot_base_dir}dovecot-mysql.conf"
    }

    'RedHat': {
      $config_file_source         = downcase($::osfamily)
      ## PHP global variables
      $php_base_dir               = '/etc/php5/'
      ## Apache globales variables
      $apache_base_dir            = '/etc/apache2/'
      $apache_confd               = "${apache_base_dir}conf.d/"
      $apache_conf                = "${apache_base_dir}apache2.conf"
      $apache_service_name        = 'apache2'
      $apache_user                = 'www-data'
      $apache_group               = 'www-data'
      $virtual_available          = "${apache_base_dir}sites-available/"
      $virtual_active             = "${apache_base_dir}sites-enabled/"
      $package_prefix             = 'libapache2-mod-'

      ## Mysql globales var
      $mysql_basedir              = '/usr'
      $mysql_datadir              = '/var/lib/mysql'
      $mysql_service_name         = 'mysql'
      $mysql_client_package_name  = 'mysql-client'
      $mysql_server_package_name  = 'mysql-server'
      $mysql_socket               = '/var/run/mysqld/mysqld.sock'
      $mysql_pidfile              = '/var/run/mysqld/mysqld.pid'
      $mysql_config_file          = '/etc/mysql/my.cnf'
      $mysql_log_error            = '/var/log/mysql/error.log'
      $mysql_ruby_package_name    = 'libmysql-ruby'
      $mysql_python_package_name  = 'python-mysqldb'
      $mysql_php_package_name     = 'php5-mysql'
      $mysql_java_package_name    = 'libmysql-java'
      $mysql_root_group           = 'root'
      $mysql_ssl_ca               = '/etc/mysql/cacert.pem'
      $mysql_ssl_cert             = '/etc/mysql/server-cert.pem'
      $mysql_ssl_key              = '/etc/mysql/server-key.pem'

      ## Postfix globales variables
      $postfix_package            = 'postfix'
      $postfix_service            = 'postfix'
      $postfix_service_hasstatus  = true
      $postfix_service_hasrestart = true
      $postfix_aliases            = '/etc/aliases'
      $postfix_mailname           = '/etc/mailname'
      $postfix_newaliases_cmd     = '/usr/bin/newaliases'
      $postfix_config_dir         = '/etc/postfix/'
      $postfix_master             = "${postfix_config_dir}master.cf"
      $postfix_main               = "${postfix_config_dir}main.cf"
      $postfix_package_mailx      = 'bsd-mailx'

      # Postfixadmin globales variables
      $pfa_version                = '2.3.6'
      $pfa_url                    = "http://downloads.sourceforge.net/project/postfixadmin/postfixadmin/postfixadmin-${pfa_version}/postfixadmin_${pfa_version}-1_all.rpm"
      $pfa_base_dir               = '/usr/share/postfixadmin/'
      $pfa_config_dir             = '/etc/postfixadmin/'
      $pfa_conf_file              = "${pfa_config_dir}config.inc.php"
      $pfa_apache_conf            = "${pfa_config_dir}apache.conf"

      ## Roundcube
      $rc_version                 = '0.8.4'
      $rc_url                     = "http://garr.dl.sourceforge.net/project/roundcubemail/roundcubemail/${rc_version}/roundcubemail-${rc_version}.tar.gz"
      $rc_base_dir                = '/usr/share/roundcube/'
      $rc_config_dir              = "${rc_base_dir}config"
      $rc_db_config               = "${rc_config_dir}db.inc.php"
      $rc_main_config             = "${rc_config_dir}main.inc.php"

      ## Dovecot globales variables 'dovecot': {
      $dovecot_base_dir           = '/etc/dovecot/'
      $dovecot_conf               = "${rc_base_dir}dovecot.conf"
      $dovecot_sieve              = "${rc_base_dir}default.sieve"
      $dovecot_query              = "${rc_base_dir}dovecot-mysql.conf"

    }

    'FreeBSD': {
      $config_file_source         = downcase($::osfamily)
      ## Php globales variables
      $php_base_dir               = '/usr/lcoal/etc/php5/'
      ### Mysql
      $mysql_basedir              = '/usr/local'
      $mysql_datadir              = '/var/db/mysql'
      $mysql_service_name         = 'mysql-server'
      $mysql_client_package_name  = 'databases/mysql55-client'
      $mysql_server_package_name  = 'databases/mysql55-server'
      $mysql_socket               = '/tmp/mysql.sock'
      $mysql_pidfile              = '/var/db/mysql/mysql.pid'
      $mysql_config_file          = '/var/db/mysql/my.cnf'
      $mysql_log_error            = "/var/db/mysql/${::hostname}.err"
      $mysql_ruby_package_name    = 'ruby-mysql'
      $mysql_ruby_package_provider= 'gem'
      $mysql_python_package_name  = 'databases/py-MySQLdb'
      $mysql_php_package_name     = 'php5-mysql'
      $mysql_java_package_name    = 'databases/mysql-connector-java'
      $mysql_root_group           = 'wheel'
      $mysql_ssl_ca               = undef
      $mysql_ssl_cert             = undef
      $mysql_ssl_key              = undef
      ##postfix
      $postfix_package            = 'postfix'
      $postfix_service            = 'postfix'
      $postfix_service_hasstatus  = true
      $postfix_service_hasrestart = true
      $postfix_aliases            = '/etc/aliases'
      $postfix_mailname           = '/etc/mailname'
      $postfix_newaliases_cmd     = '/usr/bin/newaliases'
      $postfix_config_dir         = '/etc/postfix/'
      $postfix_master             = "${postfix_config_dir}master.cf"
      $postfix_main               = "${postfix_config_dir}main.cf"
      $package_mailx              = 'bsd-mailx'
      ## Postfixadmin
      $pfa_version                = '2.3.6'
      $pfa_url                    = "http://downloads.sourceforge.net/project/postfixadmin/postfixadmin/postfixadmin-${pfa_version}/postfixadmin_${pfa_version}.tar.gz"
      $pfa_base_dir               = '/usr/share/postfixadmin/'
      $pfa_config_dir             = '/etc/postfixadmin/'
      $pfa_conf_file              = "${pfa_config_dir}config.inc.php"
      $pfa_apache_conf            = "${pfa_config_dir}apache.conf"
      ## Roundcube
      $rc_version                 = '0.8.4'
      $rc_url                     = "http://garr.dl.sourceforge.net/project/roundcubemail/roundcubemail/${rc_version}/roundcubemail-${rc_version}.tar.gz"
      $rc_base_dir                = '/usr/share/roundcube/'
      $rc_config_dir              = "${rc_base_dir}config"
      $rc_db_config               = "${rc_config_dir}db.inc.php"
      $rc_main_config             = "${rc_config_dir}main.inc.php"
      # Dovecot
      $dovecot_base_dir           = '/etc/dovecot/'
      $dovecot_conf               = "${dovecot_base_dir}dovecot.conf"
      $dovecot_sieve              = "${dovecot_base_dir}default.sieve"
      $dovecot_query              = "${dovecot_base_dir}dovecot-mysql.conf"
    }

   default: {
          fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat, Debian, and FreeBSD")
        }
    }
}
