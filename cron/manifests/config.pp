# This class deploys the cron environment for your environment.
<<<<<<< HEAD

  class cron::config {
  cron { 'clearCache':
  ensure  => present,
  user    => 'root',
  command => '/bin/sh /root/clearCache2016.sh',
  hour    => '0',
  minute  => '15',
  hour    => '1',
  minute  => '45',
  }
   
  cron { 'TuneDatabase':
  ensure  => present,
  user    => 'root',
  command => '/bin/sh /root/TuneDatabase.sh',
  minute  => '0',
  } 
  }
=======

  class cron::config {
  cron { 'clearCache':
  ensure  => present,
  user    => 'root',
  command => '/bin/sh /root/clearCache2016.sh',
  hour    => '1',
  minute  => '45',
  }
 
  cron { 'TuneDatabase':
  ensure  => present,
  user    => 'root',
  command => '/bin/sh /root/TuneDatabase.sh',
  hour    => '0',
  minute  => '45',
  }
  }
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
