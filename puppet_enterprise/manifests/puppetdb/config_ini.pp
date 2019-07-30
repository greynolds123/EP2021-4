# This class is for setting up the PuppetDB config.ini configuration file
#
# @param command_processing_threads [Integer] This defines how many
#        command processing threads to use. Each thread can process
#        a single command at a time.
<<<<<<< HEAD
# @param concurrent_writes [Integer] This defines how many threads can persist
#        commands to the disk-based queue.
class puppet_enterprise::puppetdb::config_ini(
  String  $confdir,
  Integer $command_processing_threads,
  Integer $concurrent_writes,
) inherits puppet_enterprise::params {
  include puppet_enterprise::packages
=======
class puppet_enterprise::puppetdb::config_ini(
  String  $confdir,
  Integer $command_processing_threads,
) inherits puppet_enterprise::params {
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547

  $config_ini = "${confdir}/config.ini"

  file { $config_ini :
    ensure  => present,
    owner   => 'pe-puppetdb',
    group   => 'pe-puppetdb',
    mode    => '0640',
    require => Package['pe-puppetdb'],
  }

  #Set the defaults
  Pe_ini_setting {
    path    => $config_ini,
    ensure  => present,
    require => File[$config_ini],
  }

  pe_ini_setting { 'config.ini threads command-processing section' :
    section => 'command-processing',
    setting => 'threads',
    value   => pe_max($command_processing_threads, 1),
    notify  => Service['pe-puppetdb'],
  }
<<<<<<< HEAD

  pe_ini_setting { 'config.ini concurrent-writes command-processing section' :
    section => 'command-processing',
    setting => 'concurrent-writes',
    value   => pe_max($concurrent_writes, 1),
    notify  => Service['pe-puppetdb'],
  }
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
}
