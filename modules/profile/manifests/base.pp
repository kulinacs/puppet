class profile::base {
  class { '::ntp': }

  class {'::puppet_agent':
    package_version => '5.5.6',
    manage_repo     => false,
  }

  package { 'zsh':
    ensure => 'installed',
  }
}
