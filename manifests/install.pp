#Class: fts::install
class fts::install (
  $db_type          = $fts::params::db_type,
  $orapkgs          = $fts::params::orapkgs,
  $fts3_repo        = $fts::params::fts3_repo,
  $repo_includepkgs = $fts::params::repo_includepkgs,
  $version          = $fts::params::version,
  $rest_version     = $fts::params::rest_version,
  $monitoring_version = $fts::params::monitoring_version
) inherits fts::params {

  package{'httpd':
    ensure => present
  }

  # Specify an order in case an explicit version is set.

  package{['fts-server','fts-client','fts-libs','fts-infosys','fts-msg']:
    ensure  => $version,
    require => Yumrepo['fts']
  }
  # The rpm dependency is present but we must get the correct
  # version fts-libs in stalled first rather than as a
  # dependency of fts-mysql.
  package{"fts-${db_type}":
    ensure  => $version,
    require => Package['fts-libs']
  }

  package{['fts-monitoring','fts-monitoring-selinux']:
    ensure  => $monitoring_version,
    require => Yumrepo['fts']
  }
  package{['fts-rest','fts-rest-selinux']:
    ensure  => $rest_version,
    require => Yumrepo['fts']
  }

  yumrepo {'fts':
    descr       => 'FTS service',
    baseurl     => $fts3_repo,
    gpgcheck    => '0',
    priority    => '15',
    enabled     => '1',
    includepkgs => join($repo_includepkgs,',')
  }

  # Install oracle client if needed.
  if $::db_type == 'oracle' {
    package{$orapkgs:
      ensure => present,
    }
  }

  # Install fts certs into correct location.
  file{'/etc/grid-security/fts3hostcert.pem':
    ensure  => file,
    source  => 'file:/etc/grid-security/hostcert.pem',
    mode    => '0644',
    owner   => 'fts3',
    group   => root,
    require => Package['fts-server'] # fts-server package creates the fts3 user.'

  }
  file{'/etc/grid-security/fts3hostkey.pem':
    ensure  => file,
    source  => 'file:/etc/grid-security/hostkey.pem',
    mode    => '0600',
    owner   => 'fts3',
    group   => 'root',
    require => Package['fts-server'] # fts-server package creates the fts3 user.'
  }

}
