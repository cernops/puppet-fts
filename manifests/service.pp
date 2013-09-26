class fts::service {

    include ('fetchcrl')

    service{'fts-server':
       enable    => true,
       ensure    => running,
       subscribe => Package['fts-server']       
    }
    service{'fts-msg-bulk':
       enable => true,
       ensure => running,
       subscribe => Package['fts-server']
    }
    service{'fts-records-cleaner':
       enable => true,
       ensure => running,
    }
    service{'fts-msg-cron':
       enable => true,
       ensure => running,
    }
    service{'fts-bdii-cache-updater':
       enable => true,
       ensure => running,
    }
    service{'fts-bringonline':
       enable => true,
       ensure => running,
       subscribe => Package['fts-server']
    }                
    service{'httpd':
       enable => true,
       ensure => running,
       subscribe => [Package['fts-rest'], Class['fetchcrl']]
   } 

   service{['bdii','fts-info-publisher']:
       enable => true,
       ensure => running,
   }
}

