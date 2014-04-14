class apache::module::actions {
  require apache::install

  exec {
    "enable-apache-actions":
      command => '/usr/sbin/a2enmod actions',
      creates => '/etc/apache2/mods-enabled/actions.load',
      notify => Service['apache2'];
  }
}
