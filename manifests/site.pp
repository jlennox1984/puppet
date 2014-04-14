node "ip-172-31-11-216.us-west-2.compute.internal"{
     apache::vhost{"www.mwds.ca": } 
     apache::vhost{"imp.mwds.ca":}
     apache::vhost{"internals.mwds.ca":}
  include postgres::server
  
  mail::server {"mail.mwds.ca":
       server => 'mail.mwds.ca',
       domain => 'mwds.ca'
       
       }
}
