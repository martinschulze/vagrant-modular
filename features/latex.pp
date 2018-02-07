# LaTeX:
package { 'texstudio' :
 ensure   => latest,
 require => Package[ 'texlive-full' ],
}

package { 'texlive-full' :
 ensure => present,
}

package { 'python-pygments' :
 ensure => latest,
}
package { 'jabref' : 
 ensure => latest,
}

augeas { 'augeas_test' :
 context => '/files/etc/default/apport',
 changes => 'set enabled 0',
}

file { "/home/${username}/Desktop/texstudio.desktop":
 ensure  => present,
 source  => "/usr/share/applications/texstudio.desktop",
 owner   => "${username}",
 group   => "${username}",
 mode    => '0755',
 require => [ Package['texstudio'], ],
}
