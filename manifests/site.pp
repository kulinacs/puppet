node default {
  class { 'profile::base': }
}

node 'elastic.hm.kulinacs.com' {
  class { 'docker': }
  class { 'katello_agent': }
}

node 'faas.hm.kulinacs.com' {
  class { 'docker': }
  class { 'katello_agent': }
}
