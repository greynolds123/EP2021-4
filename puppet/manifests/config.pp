<<<<<<< HEAD
<<<<<<< HEAD
# Set up the puppet config
# @api private
class puppet::config(
  $allow_any_crl_auth  = $::puppet::allow_any_crl_auth,
  $auth_allowed        = $::puppet::auth_allowed,
  $auth_template       = $::puppet::auth_template,
  $ca_server           = $::puppet::ca_server,
  $ca_port             = $::puppet::ca_port,
  $dns_alt_names       = $::puppet::dns_alt_names,
  $listen_to           = $::puppet::listen_to,
  $module_repository   = $::puppet::module_repository,
  $pluginsource        = $::puppet::pluginsource,
  $pluginfactsource    = $::puppet::pluginfactsource,
  $puppet_dir          = $::puppet::dir,
  $puppetmaster        = $::puppet::puppetmaster,
  $syslogfacility      = $::puppet::syslogfacility,
  $srv_domain          = $::puppet::srv_domain,
  $use_srv_records     = $::puppet::use_srv_records,
  $additional_settings = $::puppet::additional_settings,
  $client_certname     = $::puppet::client_certname,
) {
  puppet::config::main{
    'vardir': value => $::puppet::vardir;
    'logdir': value => $::puppet::logdir;
    'rundir': value => $::puppet::rundir;
    'ssldir': value => $::puppet::ssldir;
    'privatekeydir': value => '$ssldir/private_keys { group = service }';
    'hostprivkey': value => '$privatekeydir/$certname.pem { mode = 640 }';
    'show_diff': value  => $::puppet::show_diff;
    'codedir': value => $::puppet::codedir;
  }

  if $module_repository and !empty($module_repository) {
    puppet::config::main{'module_repository': value => $module_repository; }
  }
  if $ca_server and !empty($ca_server) {
    puppet::config::main{'ca_server': value => $ca_server; }
  }
  if $ca_port {
    puppet::config::main{'ca_port': value => $ca_port; }
  }
  if $dns_alt_names and !empty($dns_alt_names) {
    puppet::config::main{'dns_alt_names': value => $dns_alt_names; }
  }
  if $use_srv_records {
    unless $srv_domain {
      fail('$::domain fact found to be undefined and $srv_domain is undefined')
    }
    puppet::config::main{
      'use_srv_records': value => true;
      'srv_domain': value => $srv_domain;
    }
  } else {
    puppet::config::main {
      'server': value => pick($puppetmaster, $::fqdn);
    }
  }
  if $pluginsource {
    puppet::config::main{'pluginsource': value => $pluginsource; }
  }
  if $pluginfactsource {
    puppet::config::main{'pluginfactsource': value => $pluginfactsource; }
  }
  if $syslogfacility and !empty($syslogfacility) {
    puppet::config::main{'syslogfacility': value => $syslogfacility; }
  }
  if $client_certname {
    puppet::config::main {
      'certname': value => $client_certname;
    }
  }

  $additional_settings.each |$key,$value| {
    puppet::config::main { $key: value => $value }
  }

  file { $puppet_dir:
    ensure => directory,
    owner  => $::puppet::dir_owner,
    group  => $::puppet::dir_group,
  }
  -> case $::osfamily {
    'Windows': {
      concat { "${puppet_dir}/puppet.conf":
        mode           => '0674',
        ensure_newline => true,
      }
    }

    default: {
      concat { "${puppet_dir}/puppet.conf":
        owner          => 'root',
        group          => $::puppet::params::root_group,
        mode           => '0644',
        ensure_newline => true,
      }
    }
  }
  ~> file { "${puppet_dir}/auth.conf":
    content => template($auth_template),
  }
=======
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
# == Class: puppet::config
#
class puppet::config {
  if $::puppet::config_dir_source {
    file { 'puppet.dir':
      ensure  => $::puppet::config_dir_ensure,
      path    => $::puppet::config_dir_path,
      force   => $::puppet::config_dir_purge,
      purge   => $::puppet::config_dir_purge,
      recurse => $::puppet::config_dir_recurse,
      source  => $::puppet::config_dir_source,
      notify  => $::puppet::config_file_notify,
      require => $::puppet::config_file_require,
    }
  }

  if $::puppet::config_file_path and $::puppet::server_mode == undef {
    file { 'puppet.conf':
      ensure  => $::puppet::config_file_ensure,
      path    => $::puppet::config_file_path,
      owner   => $::puppet::config_file_owner,
      group   => $::puppet::config_file_group,
      mode    => $::puppet::config_file_mode,
      source  => $::puppet::config_file_source,
      content => $::puppet::config_file_content,
      notify  => $::puppet::config_file_notify,
      require => $::puppet::config_file_require,
    }
  }
<<<<<<< HEAD
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
}
