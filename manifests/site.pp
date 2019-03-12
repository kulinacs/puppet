node 'puppet.hm.kulinacs.com' {
}

node 'ipa.hm.kulinacs.com' {
  class { 'katello_agent': }
}
