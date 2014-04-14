class postgres::server {
  package {
    "postgresql":
      ensure => installed;
  }

  service {
    "postgresql":
      ensure => running,
      enable => true,
      hasstatus => true,
      require => Package['postgresql'];
  }
}
