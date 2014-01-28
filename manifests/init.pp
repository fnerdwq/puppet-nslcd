# == Class: nslcd
#
# This class configures nslcd.
#
# This works on Debian and RedHat like systems.
# Puppet Version >= 3.4.0
#
# === Paramters
#
# TODO
#
# === Examples
#
# include nslcd
#
# === Authors
#
# Frederik Wagner <wagner@wagit.de>
#
# === Copyright
#
# Copyright 2014 Frederik Wagner
#
class nslcd (
  $ensure       = 'running',
  $uid          = 'nslcd',
  $gid          = 'nslcd',
  $uri          = undef,
  $base         = undef,
  $ldap_version = 3,
  $binddn       = undef,
  $bindpw       = undef,
  $scope        = undef,
  $filter       = undef,
  $map          = undef,
) {

  include nslcd::params

  # TODO: Parmeter check

  contain 'nslcd::install'
  contain 'nslcd::config'
  contain 'nslcd::service'

  Class['nslcd::install']
  -> Class['nslcd::config']
  ~> Class['nslcd::service']

}
