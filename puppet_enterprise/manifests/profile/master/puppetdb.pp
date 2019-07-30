# This class configures the master node to be able to communicate with PuppetDB.
# The configuration that needs to be done is telling the master where to find
# the PuppetDB node and how to submit data.
#
# This class is called internally by the Master profile, and should not be called
# directly.
#
<<<<<<< HEAD
# @param puppetdb_host Array[String] The hostname of the puppetdb node.
# @param puppetdb_port Array[Integer] The post that puppetdb listens on.
# @param command_broadcast [Boolean] Toggles the puppetdb.conf command_broadcast setting.
=======
# @param puppetdb_host [String] The hostname of the puppetdb node.
# @param puppetdB_port [Integer] The post that puppetdb listens on.
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
# @param include_unchanged_resources [Boolean] Toggles the puppetdb.conf include_unchanged_resources setting.
# @param soft_write_failure [Boolean] Toggles the puppetdb.conf soft_write_failure setting.
# @param facts_terminus [String] The terminus to use to submit facts
# @param report_processor_ensure [String] Toggles presence of the puppetdb report processor in puppet.conf
class puppet_enterprise::profile::master::puppetdb(
<<<<<<< HEAD
  Array[String] $puppetdb_host,
  Array[Integer] $puppetdb_port,
  $command_broadcast           = true,
  $sticky_read_failover        = true,
=======
  $puppetdb_host,
  $puppetdb_port,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  $include_unchanged_resources = true,
  $soft_write_failure          = false,
  $facts_terminus              = 'puppetdb',
  $report_processor_ensure     = 'present',
) inherits puppet_enterprise::params {

  pe_validate_re($report_processor_ensure, [ '^(absent|present)$' ])

  $confdir = '/etc/puppetlabs/puppet'

  Pe_ini_setting {
    ensure  => present,
    section => 'main'
  }

  # Start
  # puppetdb.conf
  file { "${confdir}/puppetdb.conf":
    ensure  => file,
    mode    => '0644',
  }

<<<<<<< HEAD

  $pdb_server_urls = pe_format_urls('https', $puppetdb_host, $puppetdb_port)
=======
  # For PuppetDB HA, a user may pass in an Array to specify their PuppetDBs

  $pdb_server_urls = pe_format_urls('https', pe_any2array($puppetdb_host), pe_any2array($puppetdb_port))
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  pe_ini_setting { 'puppetdb.conf_server_urls':
    ensure  => present,
    path    => "${confdir}/puppetdb.conf",
    section => 'main',
    setting => 'server_urls',
    value   => pe_join($pdb_server_urls, ','),
  }

<<<<<<< HEAD
  pe_ini_setting { 'puppetdb.conf_command_broadcast':
    path    => "${confdir}/puppetdb.conf",
    setting => 'command_broadcast',
    value   => $command_broadcast,
  }

=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  pe_ini_setting { 'puppetdb.conf_include_unchanged_resources':
    path    => "${confdir}/puppetdb.conf",
    setting => 'include_unchanged_resources',
    value   => $include_unchanged_resources,
  }

  pe_ini_setting { 'puppetdb.conf_soft_write_failure':
    path    => "${confdir}/puppetdb.conf",
    setting => 'soft_write_failure',
    value   => $soft_write_failure,
  }
<<<<<<< HEAD

  pe_ini_setting { 'puppetdb.conf_sticky_read_failover':
    path    => "${confdir}/puppetdb.conf",
    setting => 'sticky_read_failover',
    value   => $sticky_read_failover,
  }
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  # End

  # Start
  # puppet.conf
  pe_ini_setting { 'storeconfigs' :
    path    => "${confdir}/puppet.conf",
    section => 'master',
    setting => 'storeconfigs',
    value   => true,
  }

  pe_ini_setting { 'storeconfigs_backend' :
    path    => "${confdir}/puppet.conf",
    section => 'master',
    setting => 'storeconfigs_backend',
    value   => 'puppetdb',
  }

  pe_ini_subsetting { 'reports_puppetdb' :
    ensure               => $report_processor_ensure,
    path                 => "${confdir}/puppet.conf",
    section              => 'master',
    setting              => 'reports',
    subsetting           => 'puppetdb',
    subsetting_separator => ',',
  }
  # End

  file { "${confdir}/routes.yaml":
    ensure  => present,
    content => template('puppet_enterprise/master/routes.yaml.erb'),
    owner   => 'pe-puppet',
    group   => 'pe-puppet',
    mode    => '0444',
  }
}
