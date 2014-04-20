define mail::server($servername,$domainname){

 package {
  "postfix": ensure=>'installed';
  "dovecot-common": ensure=>'installed';
  "dovecot-postfix":  ensure=>'installed';
 "dovecot-imapd": ensure=>'installed';
  "dovecot-pop3d": ensure=>'installed';
  }
## Files for Postfix and Dovecot

file{ '/etc/postfix/main.cf':
  mode => 0644,
  owner => postfix,
  group =>postfix,
  content =>template('mail/main.cf.erb'),
  require =>Exec['postfixreload'],
  }
file{ '/etc/dovecot/dovecot.conf':
    mode => 0644,
    owner => root,
    group =>root,
    source => "puppet:///modules/mail/dovecot.conf",
    require =>Exec['postfixreload'],
    }
    

  exec { postfixreload :
    command => "/usr/bin/service postfix restart";
  }
  
}
