class docker (
  $version    = $docker::params::version,
  $ensure     = $docker::params::ensure,
  $enable     = $docker::params::enable,
){
  yumrepo { 'Docker CE Stable':
    baseurl  => 'https://download.docker.com/linux/fedora/$releasever/$basearch/stable',
    ensure   => present,
    enabled  => true,
    gpgcheck => true,
    gpgkey   => 'https://download.docker.com/linux/fedora/gpg',
  }

  package { 'docker-ce':
    ensure  => $version,
    require => Yumrepo['Docker CE Stable'],
  }

  service { 'docker':
    ensure  => $ensure,
    enable  => $enable,
    require => Package['docker-ce'],
  }
}
