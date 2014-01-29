# == Class: nslcd
#
# This class configures nslcd.
#
# This works on Debian and RedHat like systems.
# Puppet Version >= 3.4.0
#
# === Paramters
#
# [*ensure*]
#   Should we install nscld at all, takes all valid ensure values for the
#   package provide
#   *Optional* (defaults to installed)
#
# [*service*]
#   Should the nscd service be running
#   *Optional* (defaults to running)
#
# [*uid*]
#   This specifies the user id with which the daemon should be  run.
#   *Optional* (defaults to nslcd)
#
# [*gid*]
#   This specifies the group id with which the daemon should be run.
#   *Optional* (defaults to nslcd)
#
# [*uri*]
#   Specifies the LDAP URI of the server to  connect  to.   The  URI
#   scheme  may  be  ldap, ldapi or ldaps, specifying LDAP over TCP,
#   ICP or SSL respectively (if supported by the LDAP library).
#   **Required** (dfeaults to false)
#
# [*base*]
#   Specifies  the  base  distinguished  name  (DN) to use as search
#   base.
#   **Required** (defaults to false)
#
# [*ldap_version*]
#   Specifies  the version of the LDAP protocol to use.  The default
#   is to use the maximum version supported by the LDAP library.
#   *Optional* (defaults to 3)
#
# [*binddn*]
#   Specifies the distinguished name  with  which  to  bind  to  the
#   directory  server  for  lookups.   The default is to bind anony‐
#   mously.
#   *Optional* (defaults to false)
#
# [*bindpw*]
#   Specifies the credentials with which to bind.   This  option  is
#   only  applicable  when  used with binddn above.
#   *Optional* (defaults to false)
#
# [*scope*]
#   Specifies the search scope (subtree, one level or base  object).
#   The  default scope is subtree; base scope is almost never useful
#   for name service lookups.
#   *Optional* (defaults to false)
#
# [*filter*]
#   The FILTER is an LDAP search filter to use for a  specific  map.
#   *Optional* (defaults to {})
#
#   Format:  { map => filter, ... }
#
# [*map*]
#   This option allows for custom attributes to be looked up instead
#   of  the  default RFC 2307 attributes.
#   *Optional* (defaults to {})
#
#   Format:  { map => { attribute => newattribute, ...}, ...}
#
# [*config_template*]
#   A different nscd.conf template can be specified. Be sure to include
#   all parameters.
#   *Optional* (defaults to nslcd/nslcd.conf.erb)
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
  $ensure          = 'installed',
  $service         = 'running',
  $uid             = 'nslcd',
  $gid             = 'nslcd',
  $uri             = false,
  $base            = false,
  $ldap_version    = 3,
  $binddn          = false,
  $bindpw          = false,
  $scope           = false,
  $filter          = {},
  $map             = {},
  $config_template = 'nslcd/nslcd.conf.erb'
) {

  include nslcd::params

  # Parmeter check
  validate_string($ensure)
  validate_string($uid)
  validate_string($gid)

  # must be set!
  validate_string($uri)
  validate_string($base)

  if $binddn { validate_string($binddn) }
  if $bindpw { validate_string($bindpw) }
  if $scope  { validate_string($scope) }

  if !is_integer($ldap_version) {
    fail('$ldap_version must be Integer if set)')
  }
  validate_hash($filter)
  validate_hash($map)
  validate_string($config_template)

  # handle package
  contain 'nslcd::install'

  # handle configuration and service if package installed
  if $ensure !~ /^(absent|purged)$/ {
    contain 'nslcd::config'
    contain 'nslcd::service'

    Class['nslcd::install']
    -> Class['nslcd::config']
    ~> Class['nslcd::service']
  }

}
