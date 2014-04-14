class apache::module::rewrite {
  require apache::install

  exec {
    "enable-apache-rewrite":
      command => '/usr/sbin/a2enmod rewrite',
      creates => '/etc/apache2/mods-enabled/rewrite.load',
      notify => Service['apache2'];
  }
}
