class profile::base {
  class { '::ntp': }

  package { 'zsh':
    ensure => 'installed',
  }

  service { 'puppet':
    ensure => 'running',
    enable => 'true',
  }
}
