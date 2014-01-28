# Installs the package containing nslcd (private)
class nslcd::install {

  package { 'nslcd':
    ensure => present,
    name   => $nslcd::params::package,
  }

}
