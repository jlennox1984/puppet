define apache::vhost(
  $docroot='unconfigured-docroot',
  $path_to_404 = '/404.html',
  $port='80',
  $priority='000',
  $ssl=true,
  $serveraliases = '',
  $template='apache/vhost.conf.erb')
{

  include apache
  $realdocroot = $docroot ? {
    'unconfigured-docroot' => "/srv/www/$name",
    default =>  $docroot,
  }

  if ($docroot == 'unconfigured-docroot') {
    file {
      "/srv/www/$name":
        ensure => directory,
        owner => root,
        group => root,
        mode => 0755,
    }
  }

  file {
    "/etc/apache2/sites-enabled/${priority}-${name}.conf":
      ensure => "/etc/apache2/sites-available/${name}.conf";
    "/etc/apache2/sites-available/${name}.conf":
      content => template($template),
      owner => 'root',
      group => 'root',
      mode => '644',
      require => Class["apache::install"],
      notify => [Class["apache::service"],Service['apache2']],
  }
}
