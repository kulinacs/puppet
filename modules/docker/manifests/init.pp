class docker (
  $version    = $docker::params::version,
  $ensure     = $docker::params::ensure,
  $enable     = $docker::params::enable,
  $managerepo = $docker::params::managerepo,
){
  if $managerepo {
    yumrepo { 'Docker CE Stable':
      baseurl  => 'https://download.docker.com/linux/fedora/$releasever/$basearch/stable',
      ensure   => present,
      enabled  => true,
      gpgcheck => true,
      gpgkey   => 'https://download.docker.com/linux/fedora/gpg',
    }
  }

  package { 'docker-ce':
    ensure => $version,
  }

  service { 'docker':
    ensure => $ensure,
    enable => $enable,
  }
}
