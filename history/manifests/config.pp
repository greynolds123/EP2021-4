# This class adds history.sh to /etc/profile

  class history::config {
  file { '/etc/profile.d/history.sh':
  owner  => 'root',
  group  => 'root',
  mode   =>   '0644',
  source =>  'puppet:///modules/history/history.sh',
  }
<<<<<<< HEAD
=======

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  exec { 'history_edit':
  command => '/bin/sh /etc/profile.d/history.sh',
  path    => '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin',
  onlyif  => 'grep -c /etc/profile.d/ /etc/profile.d/history.sh 
  && exit 1 || exit 0'
<<<<<<< HEAD
 }
 }
=======
  }
  }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
