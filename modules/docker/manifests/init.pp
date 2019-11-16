# docker installs and enables docker
class docker (
  $version = $docker::params::version,
)
{
  package { 'docker-ce':
    ensure  => $version,
  }

  service { 'docker':
    ensure  => running,
    enable  => true,
    require => Package['docker-ce'],
  }
}
