#Class: fts::service
class fts::service {

  include ('fetchcrl')

  service{'fts-server':
    ensure    => running,
    enable    => true,
    subscribe => Package['fts-server']
  }
  service{'fts-msg-bulk':
    ensure    => running,
    enable    => true,
    subscribe => Package['fts-server']
  }
  service{'fts-records-cleaner':
    ensure => running,
    enable => true,
  }
  service{'fts-msg-cron':
    ensure => running,
    enable => true,
  }
  service{'fts-bdii-cache-updater':
    ensure => running,
    enable => true,
  }
  service{'fts-bringonline':
    ensure    => running,
    enable    => true,
    subscribe => Package['fts-server']
  }
  service{'httpd':
    ensure    => running,
    enable    => true,
    subscribe => [Package['fts-rest'], Class['fetchcrl']]
  }

  service{['bdii','fts-info-publisher']:
    ensure => running,
    enable => true,
  }
}

