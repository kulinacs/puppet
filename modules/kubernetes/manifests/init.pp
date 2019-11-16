# kubernetes installs and sets up a system to be managed by kubeadm
class kubernetes (
  $version = $kubernetes::params::version,
)
{
  include ::docker

  yumrepo { 'kubernetes':
      baseurl => 'https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64',
      enabled => 1,
  }

  package { 'kubelet':
    ensure  => $version,
    require => Yumrepo['kubernetes'],
  }

  package { 'kubeadm':
    ensure  => $version,
    require => Yumrepo['kubernetes'],
  }

  package { 'kubectl':
    ensure  => $version,
    require => Yumrepo['kubernetes'],
  }

  kmod::load { 'br_netfilter': }

  sysctl { 'net.bridge.bridge-nf-call-iptables':
    ensure => present,
    value  => '1',
  }

  sysctl { 'net.bridge.bridge-nf-call-ip6tables':
    ensure => present,
    value  => '1',
  }

  service { 'kubelet':
    ensure  => running,
    enable  => true,
    require => Package['kubelet'],
  }
}
