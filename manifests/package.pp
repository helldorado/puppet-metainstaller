# Class: metainstaller::package
#
#   Implementation to download and configure some packages.
#
#   This class is not meant to be used by the end user
#   of the module.  It is an implementation class
#   of the composite Class[metainstaller]
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class metainstaller::package ($name, $url, $version, $home, $user) {
  
  $ext     = "gz"
  $extract = ""
  
  if defined(Package['curl']) == false {
    package { "curl": ensure => "latest" }
  }
  if defined(Package['unzip']) == false {
    package { "unzip": ensure => "latest" }
  }
  if defined(Package['gzip']) == false {
    package { "unzip": ensure => "latest" }
  }
  
  if defined(Package['bzip2']) == false {
    package { "unzip": ensure => "latest" }
  }
  
  if defined(User[$user]) == false {
    user { $user: 
      ensure     => "present",
      shell      => "/bin/bash",
      managehome => true,
      gid        => ["users","sudo"]
    }
  }

  file { "${name}-home":
    path    => $home,
    owner   => $user,
    purge   => false,
    force   => true,
    recurse => true,
    replace => false,
    source  => "puppet:///modules/metainstaller",
    require => User[$user]
  }

  exec { "${name}-download":
    command => "/usr/bin/curl -s -o ${home}/${name}-${version}.${ext} $url",
    creates => "${home}/${name}-${version}.${ext}",
    timeout => 6000,
    require => [File["${name}-home"], Package["curl"],Package["$ext"]]
  }
  
  file { "${name}-binary":
    path    => "${home}/${name}-${version}.${ext}",
    owner   => $user,
    purge   => false,
    force   => true,
    recurse => false,
    replace => false,
    mode    => 0775,
    require => Exec["${name}-download"]
  }
  
  exec { "${name}-binary-extract":
    command => "/usr/bin/${extract} ${home}/${name}-${version}.${ext}",
    cwd     => "${home}",
    creates => "${home}/${name}-${version}",
    user    => $user,
    require => [File["${name}-binary"]];
  }
  
  file { "${name}-permissions":
    path    => "${home}/${version}",
    owner   => $user,
    mode    => 0775,
    purge   => false,
    force   => true,
    recurse => true,
    replace => false,
    require => Exec["tomcat-binary-extract"];
  }
  
  file { "${name}-provision.sh":
    path    => "${home}/provision.sh",
    owner   => $user,
    mode    => 0775,
    content => template("${name}/provision.sh.erb"),
    require => Exec["${name}-binary-extract"];
  }

  file { "${name}-run.sh":
    path    => "${home}/run.sh",
    owner   => $user,
    mode    => 0775,
    content => template("${name}/run.sh.erb"),
    require => Exec["${name}-binary-extract"];
  }

  file { "${name}-server.sh":
    path    => "${home}/server.sh",
    owner   => $user,
    mode    => 0775,
    content => template("${name}/server.sh.erb"),
    require => Exec["${name}-binary-extract"];
  }

  file { "tomcat-setenv.sh":
    path    => "${home}/setenv.sh",
    owner   => $user,
    mode    => 0775,
    source  => "puppet:///modules/metainstaller/${name}/setenv.sh",
    require => Exec["${name}-binary-extract"];
  }

}