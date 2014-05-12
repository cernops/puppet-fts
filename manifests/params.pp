#Class: fts::params
class fts::params {
  $port              = 8443
  $restport          = 8446
  $logport           = 80
  $version           = hiera('fts3_version','present')
  $rest_version      = hiera('fts3_rest_version','present')
  $rest_debug        = hiera('fts3_rest_debug','false')
  $db_connect_string = hiera('fts3_db_connect_string',undef)
  $db_type           = hiera('fts3_db_type','mysql')
  $db_username       = hiera('fts3_db_username','ora_user')
  $db_password       = hiera('fts3_db_password','ora_pass')
  $msg_username      = hiera('fts3_msg_username','msg_username')
  $msg_password      = hiera('fts3_msg_password','msg_pass')
  $bdii_infosys      = hiera('fts3_bdii_infosys','lcg-bdii.cern.ch:2170')
  $host_alias        = hiera('fts3_host_alias',$::fqdn)
  $site_name         = hiera('fts3_site_name','SITE_NAME')
  $open_files        = hiera('fts3_open_files','16384')

  $fts3_repo         = hiera('fts3_fts_repo','http://grid-deployment.web.cern.ch/grid-deployment/dms/fts3/repos/el6/x86_64')
  $repo_includepkgs  = hiera('fts3_repo_includepkgs',['fts-*','gfal2-*','python-fts','srm-ifce'])

  # Specify ORACLE client packages if you need to, only relavent if db_type is oracle.
  $orapkgs           = hiera('fts3_orapkgs',['oracle-instantclient-basic','oracle-instantclient-sqlplus','rlwrap'])

}
