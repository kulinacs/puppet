# kubernetes installs and sets up a system to be managed by kubeadm
class kubernetes {

  include ::docker

  package { 'kubelet':
    ensure  => 'installed',
  }

  package { 'kubeadm':
    ensure  => 'installed',
  }

  package { 'kubectl':
    ensure  => 'installed',
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
