class metainstaller::modules::php {
    metainstaller::php::module { [
        'gd', 'curl', 'snmp',
        'mcrypt', 'memcached', 'mysql',
        'intl', 'imap',
        ]:
        #require => metainstaller::Sources_list['dotdeb-php53'],
        require => Apt::Source['dotdeb'],
        #notify  => Service['apache'],
        notify  => Service[$metainstaller::params::apache_service_name],
        #source => true
    }

#    metainstaller::php::conf { [ 'mysqli', 'pdo', 'pdo_mysql', ]:
#        require => Package['php-mysql'],
#        #notify  => Service['apache'],
#        notify  => Service[$metainstaller::params::apache_service_name],
#        source => true,
#    }

#    metainstaller::php::extra { 'lite_php_browscap':
#        require => Php::Conf['browscap'],
#        #notify  => Service['apache'],
#        notify  => Service[$metainstaller::params::apache_service_name],
#        source  => true,
#    }
}
