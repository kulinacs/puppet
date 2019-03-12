class katello_agent {
  service { 'puppet':
    ensure => 'running',
    enable => 'true',
  }
}
