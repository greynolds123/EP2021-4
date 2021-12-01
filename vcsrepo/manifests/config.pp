# Configuration file for centos_7

<<<<<<< HEAD
  class vcsrepo { '/etc/yum.d/repos.d/*': 
  ensure   => present,
  provider => git,
}
=======
  class vcsrepo::config {
  file { '/etc/yum.d/repos.d/*':
  ensure   => present,
  provider => git,
  }
  }
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
