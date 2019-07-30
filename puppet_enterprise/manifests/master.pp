# Internal class for Puppet Enterprise to manage all master-services.
#
# @param metrics_server_id [String] What ID to tag the metrics with
# @param metrics_jmx_enabled [Boolean] Toggle whether to run with JMX (Java Management Extensions) enabled.
# @param metrics_graphite_enabled [Boolean] Toggle whether to write metrics to Graphite.
<<<<<<< HEAD
# @param metrics_puppetserver_metrics_allowed [Array] A whitelist of metric names to be sent to the enabled reporters.
# @param profiler_enabled [Boolean] Whether to run the Java profiler.
# @param puppetserver_jruby_puppet_master_code_dir [String] Path to where puppetserver should read code from.  Should match puppet.conf codedir setting
# @param certname [String] The cert name the Server will use.
# @param enable_future_parser [Boolean] Toggle use of the "future" Puppet 4 parser.
# @param java_args [Hash] Key-value pairs describing the java arguments to be passed when starting the master
# @param localcacert [String] The path to the local CA cert used for generating SSL certs.
# @param manage_symlinks [Boolean] Flag to enable creation of convenience links
# @param static_catalogs Optional[Boolean] Whether to enable static catalogs on the master.
# @param static_files [Hash] Paths to static files to serve up on the master. Keys are the URLs the files will be found at, values are the paths to the folders to be served.
# @param code_manager_auto_configure [Boolean] Configure code-manager based on r10k params
# @param environment_timeout Optional[String] How long the master should cache the data it loads from an environment
# @param disable_i18n [Boolean] Disable log translation on the master to improve performance
# @param ssl_listen_port [Integer] Port puppetserver should listen on for ssl connections
# @param connect_timeout_milliseconds [Optional[Integer]] The amount of time an outbound HTTP connection will wait to connect before giving up
# @param jruby_max_active_instances [Integer] The maximum number of jruby instances that the Puppet Server will spawn to serve Agent traffic.
=======
# @param metrics_graphite_host [String] Graphite server to write metrics to..
# @param metrics_graphite_port [Integer] Port on Graphite server to write metrics to.
# @param metrics_graphite_update_interval_seconds [Integer] How often, in seconds, to wait between writing metrics to the Graphity server.
# @param metrics_puppetserver_metrics_allowed [Array] A whitelist of metric names to be sent to the enabled reporters.
# @param profiler_enabled [Boolean] Whether to run the Java profiler.
# @param certname [String] The cert name the Server will use.
# @param static_files [Hash] Paths to static files to serve up on the master. Keys are the URLs the files will be found at, values are the paths to the folders to be served.
# @param localcacert [String] The path to the local CA cert used for generating SSL certs.
# @param java_args [Hash] Key-value pairs describing the java arguments to be passed when starting the master
# @param environments_dir_mode [String] Permissions mode to set the Puppet environments directory to. User/group will be `pe-puppet`.
# @param enable_future_parser [Boolean] Toggle use of the "future" Puppet 4 parser.
# @param manage_symlinks [Boolean] Flag to enable creation of convenience links
# @param code_manager_auto_configure [Boolean] Configure code-manager based on r10k params
# @param puppetserver_jruby_puppet_master_code_dir [String] Path to where puppetserver should read code from.  Should match puppet.conf codedir setting
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
class puppet_enterprise::master(
  $metrics_server_id,
  $metrics_jmx_enabled,
  $metrics_graphite_enabled,
  $metrics_puppetserver_metrics_allowed,
  $profiler_enabled,
  String $puppetserver_jruby_puppet_master_code_dir,
<<<<<<< HEAD
  $certname                                  = $::client_cert,
  $enable_future_parser                      = undef,
  Hash $java_args                            = $puppet_enterprise::params::puppetserver_java_args,
=======
  $app_management                            = $puppet_enterprise::use_application_services,
  $certname                                  = $::client_cert,
  $enable_future_parser                      = undef,
  $java_args                                 = $puppet_enterprise::params::puppetserver_java_args,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  $localcacert                               = $puppet_enterprise::params::localcacert,
  $manage_symlinks                           = true,
  Optional[Boolean] $static_catalogs         = undef,
  $static_files                              = {},
  Optional[Boolean] $code_manager_auto_configure = undef,
  Optional[String]  $environment_timeout     = undef,
<<<<<<< HEAD
  Boolean $disable_i18n                      = false,
  Integer $ssl_listen_port                   = $puppet_enterprise::puppet_master_port,
  Optional[Integer] $connect_timeout_milliseconds = undef,
  Optional[Integer] $jruby_max_active_instances   = undef,
  Optional[Integer] $jruby_max_requests_per_instance = undef,
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
) inherits puppet_enterprise::params {

  include puppet_enterprise::packages
  Package <| tag == 'pe-master-packages' |>

<<<<<<< HEAD
  #when we switched from unpacking a tarball of modules to the pe-modules
  #package we orphaned some files that need to be removed from puppet_enterprise
  $functions_dir = "${puppet_enterprise::system_module_dir}/puppet_enterprise/lib/puppet/parser/functions"
  file { "${functions_dir}/cookie_secret_key.rb" :
    ensure => absent,
  }

=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  include puppet_enterprise::symlinks

  $user = 'pe-puppet'
  $group = 'pe-puppet'

  if $manage_symlinks {
    File <| tag == 'pe-master-symlinks' |>
  }

  class { 'puppet_enterprise::master::puppetserver':
<<<<<<< HEAD
    certname                                  => $certname,
    localcacert                               => $localcacert,
    static_files                              => $static_files,
    java_args                                 => $java_args,
    metrics_server_id                         => $metrics_server_id,
    metrics_jmx_enabled                       => $metrics_jmx_enabled,
    metrics_graphite_enabled                  => $metrics_graphite_enabled,
    metrics_puppetserver_metrics_allowed      => $metrics_puppetserver_metrics_allowed,
    profiler_enabled                          => $profiler_enabled,
    code_manager_auto_configure               => $code_manager_auto_configure,
    puppetserver_jruby_puppet_master_code_dir => $puppetserver_jruby_puppet_master_code_dir,
    puppetserver_webserver_ssl_port           => $ssl_listen_port,
    connect_timeout_milliseconds              => $connect_timeout_milliseconds,
    jruby_max_active_instances                => $jruby_max_active_instances,
    jruby_max_requests_per_instance           => $jruby_max_requests_per_instance,
=======
    certname                                 => $certname,
    localcacert                              => $localcacert,
    static_files                             => $static_files,
    java_args                                => $java_args,
    metrics_server_id                        => $metrics_server_id,
    metrics_jmx_enabled                      => $metrics_jmx_enabled,
    metrics_graphite_enabled                 => $metrics_graphite_enabled,
    metrics_puppetserver_metrics_allowed     => $metrics_puppetserver_metrics_allowed,
    profiler_enabled                         => $profiler_enabled,
    code_manager_auto_configure              => $code_manager_auto_configure,
    puppetserver_jruby_puppet_master_code_dir => $puppetserver_jruby_puppet_master_code_dir,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  File {
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0644',
  }

<<<<<<< HEAD
=======
  if !pe_empty($java_args) {
    pe_validate_hash($java_args)
  }

>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  # FIXME PACKAGING Should the packages set the permissions correctly?
  file { '/var/log/puppetlabs/puppet' :
    mode    => '0640',
  }

<<<<<<< HEAD
  file {'/etc/puppetlabs/puppet/fileserver.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

  puppet_enterprise::set_owner_group_permissions{'/etc/puppetlabs/puppet/hiera.yaml':
    file_mode   => '0644',
    owner       => 'root',
    group       => 'root',
    target_type => 'file',
  }

  puppet_enterprise::set_owner_group_permissions{'/etc/puppetlabs/puppet/puppet.conf':
    file_mode   => '0644',
    owner       => 'root',
    group       => 'root',
    target_type => 'file',
  }

=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  # This is intended to establish the pe_build file on new compile masters.
  # The installer lays down pe_build for the master of masters.
  file { '/opt/puppetlabs/server/pe_build':
    ensure  => file,
    content => pe_build_version(),
  }

  # Start
  # puppet.conf
  Pe_ini_setting {
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    notify  => Service['pe-puppetserver'],
  }

  pe_ini_setting { 'puppetserver puppetconf certname' :
    setting => 'certname',
    value   => $certname,
    section => 'master',
  }

<<<<<<< HEAD
  #always_cache_features was marked as deprecated in Puppet agent 4.5.0,
  #which shipped in PE 2016.2.0. We started enforcing absent in 2017.2.
  pe_ini_setting { 'puppetserver puppetconf always_cache_features' :
    ensure  => absent,
    setting => 'always_cache_features',
    section => 'master',
  }

  pe_ini_setting { 'puppetserver puppetconf always_retry_plugins' :
    setting => 'always_retry_plugins',
    value   => false,
=======
  pe_ini_setting { 'puppetserver puppetconf always_cache_features' :
    setting => 'always_cache_features',
    value   => 'true',
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
    section => 'master',
  }

  pe_ini_setting { 'puppetserver puppetconf user':
    setting => 'user',
    value   => $user,
    section => 'main'
  }

  pe_ini_setting { 'puppetserver puppetconf group':
    setting => 'group',
    value   => $group,
    section => 'main'
  }

  $_static_catalogs_ensure = $static_catalogs ? {
    true => 'present',
    false => 'present',
    default => 'absent',
  }

  pe_ini_setting { 'puppetserver static catalogs':
    ensure  => $_static_catalogs_ensure,
    setting => 'static_catalogs',
    value   => $static_catalogs,
    section => 'main',
  }

  $_environment_timeout_value = pe_pick( $environment_timeout, $code_manager_auto_configure ? {
    true    => 'unlimited',
    default => '0',
  } )

  pe_ini_setting { 'puppetconf environment_timeout setting':
    ensure  => present,
    setting => 'environment_timeout',
    value   => $_environment_timeout_value,
    section => 'main',
  }
<<<<<<< HEAD

  pe_ini_setting { 'puppetconf disable_i18n setting':
    ensure  => present,
    setting => 'disable_i18n',
    value   => $disable_i18n,
    section => 'master',
  }
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  # End puppet.conf
}
