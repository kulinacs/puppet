class kubernetes {
  package { 'kubelet':
    ensure  => 'installed',
  }

  package { 'kubeadm':
    ensure  => 'installed',
  }

  package { 'kubectl':
    ensure  => 'installed',
  }

  service { 'kubelet':
    ensure  => running,
    enable  => true,
    require => Package['kubelet'],
  }
}
