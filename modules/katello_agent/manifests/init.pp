# katello_agent installs the katello agent and starts the service
class katello_agent (
  $version = $katello_agent::params::version,
) inherits katello_agent::params {
  package { 'katello-agent':
    ensure  => $version,
  }

  service { 'goferd':
    ensure  => running,
    enable  => true,
    require => Package['katello-agent'],
  }
}
