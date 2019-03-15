# docker installs and enables docker
class docker {
  package { 'docker':
    ensure  => 'installed',
  }

  service { 'docker':
    ensure  => running,
    enable  => true,
    require => Package['docker'],
  }
}
