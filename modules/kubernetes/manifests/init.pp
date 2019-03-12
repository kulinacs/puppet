class kubernetes {
  package { 'docker':
    ensure  => 'installed',
  }

  package { 'kubelet':
    ensure  => 'installed',
  }

  package { 'kubeadm':
    ensure  => 'installed',
  }

  package { 'kubectl':
    ensure  => 'installed',
  }

  sysctl { "net.bridge.bridge-nf-call-iptables":
    ensure => present,
    value  => "1",
  }

  sysctl { "net.bridge.bridge-nf-call-ip6tables":
    ensure => present,
    value  => "1",
  }

  service { 'kubelet':
    ensure  => running,
    enable  => true,
    require => Package['kubelet'],
  }
}
