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
<<<<<<< HEAD
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
