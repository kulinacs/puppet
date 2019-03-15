node 'puppet.hm.kulinacs.com' {
}

node 'pve.hm.kulinacs.com' {
  class { 'puppet': }
  class { 'apcupsd': }
}

node 'ipa.hm.kulinacs.com' {
  class { 'puppet': }
  class { 'katello_agent': }
}

node /^kube\d+\.hm\.kulinacs\.com$/ {
  class { 'puppet': }
  class { 'katello_agent': }
  class { 'kubernetes': }
}
