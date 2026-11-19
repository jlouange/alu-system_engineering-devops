# Increase Nginx open-file limit

exec { 'increase-nginx-ulimit':
  command => "/bin/sed -i 's/^ULIMIT=.*/ULIMIT=\"-n 4096\"/' /etc/default/nginx",
  onlyif  => '/usr/bin/test -f /etc/default/nginx',
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure => running,
}
