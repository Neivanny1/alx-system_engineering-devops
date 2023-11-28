class { 'nginx':
  ensure  => 'installed',
  service => 'running',
}
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => '
    server {
      listen 80;

      location / {
        return 200 "Hello World!\n";
      }

      location /redirect_me {
        return 301 http://$host/;
      }
    }
  ',
  notify  => Service['nginx'],
}
file { '/etc/nginx/sites-enabled/default':
  ensure  => 'link',
  target  => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
  notify  => Service['nginx'],
}
file { '/etc/nginx/sites-enabled/default':
  ensure => 'absent',
}
service { 'nginx':
  ensure    => 'running',
  enable    => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}
