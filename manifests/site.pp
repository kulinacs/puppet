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

node /^k8s\d+\.hm\.kulinacs\.com$/ {
  class { 'puppet': }
  class { 'katello_agent': }
  class { 'kubernetes': }
}

node /^docker\d+\.hm\.kulinacs\.com$/ {
  class { 'puppet': }
  class { 'katello_agent': }
  class { 'docker': }
}
