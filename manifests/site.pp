node default {
  class { 'profile::base': }
}

node 'elastic.hm.kulinacs.com' {
  class { 'docker': }
}
