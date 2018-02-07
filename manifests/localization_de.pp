# Localization:  
package { "language-pack-de":
 ensure => present,
}

file { "/etc/default/locale":
 ensure  => present,
 content => "LANG=\"de_DE.UTF-8\"\n",
}

class { "timezone":
 timezone => "Europe/Berlin",
 ensure   => present,
}

file { "/etc/default/keyboard" :
 ensure  => present,
 content => "XKBMODEL=\"pc105\"\nXKBLAYOUT=\"de\"\nXKBVARIANT=\"nodeadkeys\"\nXKBOPTIONS=\"\"\n",
}


