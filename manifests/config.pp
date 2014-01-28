# Creating the nslcd config file (private)
class nslcd::config {

  file{ '/etc/nslcd.conf':
    ensure  => present,
    owner   => root,
    group   => $nslcd::gid,
    mode    => '0640',
    content => template('nslcd/nslcd.conf.erb'),
  }

}
