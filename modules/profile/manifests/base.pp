class profile::base {
  class { '::ntp': }

  package { 'zsh':
    ensure => 'installed',
  }
}
