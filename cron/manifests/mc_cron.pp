 #Control  the frequency of how the database is pruned.
  class cron::mc_cron { 
  cron { 'pe-puppet-console-prune-task':
  ensure   => present,
  user     => 'root',
  command  =>'/opt/puppetlabs/bin/rake -f /opt/puppet/share/puppet-dashboard/Rakefile RAILS_ENV=production reports:prune reports:prune:failed upto=${prune_upto} unit=${prune_unit} > /dev/null',
  hour     => '1',
  minute   => '0',
<<<<<<< HEAD
  minute   => '0', 
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
  }
  }
