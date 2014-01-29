# Installs the package containing nslcd (private)
class nslcd::install {

  package { 'nslcd':
    ensure => $nslcd::ensure,
    name   => $nslcd::params::package,
  }

}
