# set flavor specific variables (private)
class nslcd::params {

  case $::osfamily {
    'Debian': {
      $package = 'nslcd'
    }
    'RedHat': {
      $package = 'nss-pam-ldapd'
    }
    default:  {
      fail("Module ${module_name} is not supported on ${::operatingsystem}/${::osfamily}")
    }
  }
}
