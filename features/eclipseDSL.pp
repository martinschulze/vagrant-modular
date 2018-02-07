package { "openjdk-8-jdk":
 ensure => latest,
}

eclipse { 'eclipseDSL':
  downloadurl  => 'http://ftp.halifax.rwth-aachen.de/eclipse//technology/epp/downloads/release/oxygen/1a/eclipse-dsl-oxygen-1a-linux-gtk-x86_64.tar.gz',
  downloadfile => 'eclipse-dsl-oxygen-1a-linux-gtk-x86_64.tar.gz',
  pluginrepositories => ['http://download.eclipse.org/releases/oxygen/'],
  timeout => 1800,
  require => Package [ 'openjdk-8-jdk' ],
}

file { "/home/${username}/Desktop/eclipse.desktop":
  ensure  => present,
  source  => '/vagrant/data/eclipse.desktop',
  owner   => "${username}",
  group   => "${username}",
  mode    => '0755',
}
