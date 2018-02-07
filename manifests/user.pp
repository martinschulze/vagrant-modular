File { owner => 0, group => 0, mode => 0644 }

file { "/etc/motd":
 content => "Welcome to the multi feature VM.\n   Provisioned by Martin Schulze.\n"
}

user {"${username}":
 comment    => "${fullname}",
 ensure     => present,
 home       => "/home/${username}",
 shell      => "/bin/bash",
 groups     => ["sudo"],
 password   => "${password_string}",
 managehome => true,
}

file { "/home/${username}/Desktop":
 ensure  => directory,
 owner   => "${username}",
 group   => "${username}",
 mode    => "0755",
 require => User["${username}"], 
}

file { "/home/${username}/Desktop/commands.txt":
 ensure  => present,
 source  => "/vagrant/data/commands.txt",
 owner   => "${username}",
 group   => "${username}",
 mode    => "0644",
 require => [ User["${username}"], File["/home/${username}/Desktop"], ],
}

file { "/home/${username}/.ssh":
 ensure  => directory,
 require => User["${username}"],
 owner   => "${username}",
 group   => "${username}",
 mode    => "0755",
}

file { "/home/${username}/.ssh/id_rsa":
 ensure  => present,
 require => File["/home/${username}/.ssh"],
 source  => "/vagrant/data/ssh/id_rsa",
 owner   => "${username}",
 group   => "${username}",
 mode    => "0600",
 noop    => $no_ssh_config,
}

file { "/home/${username}/.ssh/id_rsa.pub":
 ensure  => present,
 require => File["/home/${username}/.ssh"],
 source  => "/vagrant/data/ssh/id_rsa.pub",
 owner   => "${username}",
 group   => "${username}",
 mode    => "0600",
 noop    => $no_ssh_config,
}

file { "/home/${username}/.ssh/config":
 ensure  => present,
 require => File["/home/${username}/.ssh"],
 source  => "/vagrant/data/ssh/config",
 owner   => "${username}",
 group   => "${username}",
 mode    => "0600",
 noop    => $no_ssh_config,
}


