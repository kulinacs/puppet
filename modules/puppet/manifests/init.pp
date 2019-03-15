# puppet ensures puppet is running and enabled on boot
class puppet {
  service { 'puppet':
    ensure => 'running',
    enable => true,
  }
}
