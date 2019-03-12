class puppet {
  service { 'puppet':
    ensure => 'running',
    enable => 'true',
  }
}
