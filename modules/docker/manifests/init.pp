class docker (
  $version    = $docker::params::version,
){
  yumrepo { 'docker-ce-stable':
    descr    => 'Docker CE Stable - $basearch',
    baseurl  => 'https://download.docker.com/linux/fedora/$releasever/$basearch/stable',
    ensure   => present,
    enabled  => true,
    gpgcheck => true,
    gpgkey   => 'https://download.docker.com/linux/fedora/gpg',
  }

  package { 'docker-ce':
    ensure  => $version,
    require => Yumrepo['docker-ce-stable'],
  }

  service { 'docker':
    ensure  => running,
    enable  => true,
    require => Package['docker-ce'],
  }
}
