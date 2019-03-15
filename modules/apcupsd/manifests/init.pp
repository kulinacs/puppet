class apcupsd (
  $ups_cable = $apcupsd::params::ups_cable,
  $ups_name,
  $ups_type = $apcupsd::params::ups_type,
  $ups_device = $apcupsd::params::ups_device,
) inherits apcupsd::params {
  package { 'apcupsd':
    ensure  => 'installed',
  }

  service { 'apcupsd':
    ensure  => running,
    enable  => true,
    require => Package['apcupsd'],
  }

  file { '/etc/apcupsd/apcupsd.conf':
    ensure  => file,
    content => template('apcupsd/apcupsd.conf.erb'),
    require => Package['apcupsd'],
    notify  => Service['apcupsd'],
  }
}
