# Increase the Nginx file descriptor limit and restart Nginx.

exec { 'fix-nginx-ulimit':
  command  => '/bin/sed -i \'s/^ULIMIT=.*/ULIMIT="-n 4096"/\' /etc/default/nginx && /usr/sbin/service nginx restart',
  provider => shell,
}
