# Manages the nslcd service (private)
class nslcd::service {

  case $nslcd::ensure {
    'running', true:  { $nslcd_ensure = true  }
    'stopped', false: { $nslcd_ensure = false }
    default: { fail('no valid value for $nslcd::ensure') }
  }

  service {'nslcd':
    ensure     => $nslcd_ensure,
    enable     => $nslcd_ensure,
    hasrestart => true,
    hasstatus  => true,
  }

}

