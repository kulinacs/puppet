class katello_agent (
  $version = $katello_agent::params::version,
){
  package { 'katello-agent':
    ensure  => $version,
  }

  service { 'goferd':
    ensure  => running,
    enable  => true,
    require => Package['katello-agent'],
  }
}
