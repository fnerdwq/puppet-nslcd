# Manages the nslcd service (private)
class nslcd::service {

  case $nslcd::service {
    /running|true/, true:   { $nslcd_service = true  }
    /stopped|false/, false: { $nslcd_service = false }
    default: { fail('no valid value for $nslcd::ensure') }
  }

  service {'nslcd':
    ensure     => $nslcd_service,
    enable     => $nslcd_service,
    hasrestart => true,
    hasstatus  => true,
  }

}

