Puppet module for File Transfer Service
=======================================

Overview
--------
Puppet module to configure the FTS (File Transfer Service) version 3.
For general configuration guide to the FTS see:

https://svnweb.cern.ch/trac/fts3/wiki/AdminGuide

Setup Requirements
------------------
* This configuration assumes a RHEL6 like distribution.
* The puppetlabs-firewall module is used and must be available
* The puppetlabs(or cprice404)-inifile module is used and must be avilable.
* The cernops-fetchcrl module is used.
* The cernops-voms modules is used.
* pluginsync must be enabled in puppet since this module uses ruby providers.
* host keys must be availble in the typical location
  /etc/grid-security/hostcert.pem and hostkey.

Usage
-----
Enable the FTS service with 

```puppet
include('fts')
```

All the standard settings can be set via hiera calls in the parmas.pp file. See that
file for details. In particular this is where database connection parameters are set.

There are two extra defined types both based on inifile provider.

```puppet
fts3config{'/DbThreadsnNum': value => '100'} 
```

will edit a value in /etc/fts3/fts3config

```puppet
fts3restconfig{'server:main/port': value => '20000'}
```

can be used to set a value in /etc/fts3/fts3rest.ini

License
-------
Apache II licence.

Copyright
---------
Steve Traylen <steve.traylen@cern.ch> , CERN, 2013

Support and Patches
-------------------
https://github.com/cernops/puppet-fts


