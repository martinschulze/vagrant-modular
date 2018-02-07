###############################################################################
# Fixes for Ubuntu 16.04:

user {"${username}":
 ensure     => present,
 home       => "/home/${username}",
 managehome => true,
}

# Deaktivate error reporting. Because eclipse crashes java on a regular basis,
# this helps the developer to keep his sanity.
augeas { "augeas_test" :
 context => "/files/etc/default/apport",
 changes => "set enabled 0",
}

# Remove ibus, as it interferes with localization and causes keyboard errors
package { "ibus":
 ensure => purged,
}

# Unset SSH_AUTH_SOCK to disable ssh looking for the ssh agent
exec { "/bin/echo \"\nunset SSH_AUTH_SOCK\" >> \"/home/${username}/.bashrc\"":
 unless  => "/bin/grep -qFx \"unset SSH_AUTH_SOCK\" \"/home/${username}/.bashrc\"",
 require => [ User["${username}"], ],
}

