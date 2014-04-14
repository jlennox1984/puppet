class apache::install {
  package { [ "apache2" ]:
    ensure => present,
  }

  file {
    "/etc/apache2/sites-enabled/000-default":
      ensure => absent,
      require => Package['apache2'];
    "/srv/www":
      ensure => directory,
      owner => root,
      group => root,
      mode => 0755;
  }
}
