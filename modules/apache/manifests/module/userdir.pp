class apache::module::userdir {
  require apache::install

  exec {
    "enable-apache-userdir":
      command => '/usr/sbin/a2enmod userdir',
      creates => '/etc/apache2/mods-enabled/userdir.load',
      notify => Service['apache2'];
  }
}
