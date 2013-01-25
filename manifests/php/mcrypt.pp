class metainstaller::php::mcrypt {

    package { 'php5-mcrypt':
        ensure  => present,
    }

    file { '/etc/php5/conf.d/mcrypt.ini':
         ensure  => present,
         source  => 'puppet:///metainstaller/mcrypt.ini',
    }

}
