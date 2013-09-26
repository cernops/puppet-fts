# Class: fts
class fts {

    Class['fts::install'] -> Class['fts::config'] -> Class['fts::service']
    class {'fts::install':}
    class {'fts::config': }
    class {'fts::service':}
}
