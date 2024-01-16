# Changes file name from .phpp to .php
exec { 'php':
  command => 'sed -i "s/.phpp/.php/" /var/www/html/wp-settings.php',
  path    => '/usr/bin:/usr/sbin:/bin',
}
