# fixing apache
exec { 'fix-nginx-limit':
  command => "/bin/sed -i 's/^ULIMIT=.*/ULIMIT=\"-n 4096\"/' /etc/default/nginx",
  unless  => "/bin/grep -Fxq 'ULIMIT=\"-n 4096\"' /etc/default/nginx",
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure     => running,
  hasrestart => true,
}

