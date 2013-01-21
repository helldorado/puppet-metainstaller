class metainstaller::mysql::postinstall {
  $password = generate(
      '/bin/sh',
      '-c',
      'tr -dc A-Za-z0-9 < /dev/urandom | head -c8'
    )
  exec { "MySQL: create root credentials":
      command => "/usr/bin/mysql --defaults-file=/etc/mysql/debian.cnf --execute=\"UPDATE mysql.user SET Password = PASSWORD('${password}') where user='root'\";",
      require => Class["mysql::install"],
      unless  => "mysql --user=root --password=${password} --database=mysql --host=localhost",
    }

  file { $metainstaller::params::mysql_auto_connect:
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      require => Class['metainstaller::mysql::install'],
      content => template("metainstaller/my-autoconnect.erb"),
    }
}
