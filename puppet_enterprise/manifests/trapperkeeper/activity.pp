define puppet_enterprise::trapperkeeper::activity (
  $container           = $title,
  $database_host       = 'localhost',
  $database_name       = $puppet_enterprise::params::activity_database_name,
  $database_password   = undef,
<<<<<<< HEAD
  $database_port       = $puppet_enterprise::database_port,
  $database_properties = '',
  $database_user       = $puppet_enterprise::activity_service_regular_db_user,
  $database_migration_user = $puppet_enterprise::activity_service_migration_db_user,
=======
  $database_port       = $puppet_enterprise::params::database_port,
  $database_properties = '',
  $database_user       = $puppet_enterprise::params::activity_database_user,
  Integer $maximum_pool_size  = 10,
  Integer $pool_timeout       = 30,
  Integer $pool_check_timeout = 5,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  $group               = "pe-${title}",
  $rbac_host           = 'localhost',
  $rbac_port           = $puppet_enterprise::params::console_services_api_listen_port,
  $rbac_url_prefix     = $puppet_enterprise::params::rbac_url_prefix,
  $user                = "pe-${title}",
) {
  File {
    owner => $user,
    group => $group,
    mode  => '0640',
  }

  Pe_hocon_setting {
    ensure  => present,
    notify  => Service["pe-${container}"],
  }

  # Uses
  #   $rbac_host
  #   $rbac_port
  #   $rbac_url_prefix
  file { "/etc/puppetlabs/${container}/conf.d/activity.conf":
    ensure => present,
  }
  pe_hocon_setting { 'activity.rbac-base-url':
    path    => "/etc/puppetlabs/${container}/conf.d/activity.conf",
    setting => 'activity.rbac-base-url',
    value   => "http://${rbac_host}:${rbac_port}${rbac_url_prefix}/v1",
  }
  pe_hocon_setting { 'activity.cors-origin-pattern':
    path    => "/etc/puppetlabs/${container}/conf.d/activity.conf",
    setting => 'activity.cors-origin-pattern',
<<<<<<< HEAD
    value   => '.*'
  }

  puppet_enterprise::trapperkeeper::database_settings { 'activity' :
    container           => $container,
    database_host       => $database_host,
    database_name       => $database_name,
    database_password   => $database_password,
    database_port       => Integer($database_port),
    database_properties => $database_properties,
    database_user       => $database_user,
    migration_user      => $database_migration_user,
    migration_password  => $database_password,
    group               => $group,
    user                => $user,
=======
    value   => ".*"
  }

  # Uses
  #   $database_host
  #   $database_port
  #   $database_name
  #   $database_user
  #   $database_properties
  file { "/etc/puppetlabs/${container}/conf.d/activity-database.conf":
    ensure => present,
  }
  pe_hocon_setting { 'activity.database.subprotocol':
    path    => "/etc/puppetlabs/${container}/conf.d/activity-database.conf",
    setting => 'activity.database.subprotocol',
    value   => 'postgresql',
  }
  pe_hocon_setting { 'activity.database.subname':
    path    => "/etc/puppetlabs/${container}/conf.d/activity-database.conf",
    setting => 'activity.database.subname',
    value   => "//${database_host}:${database_port}/${database_name}${database_properties}",
  }
  pe_hocon_setting { 'activity.database.user':
    path    => "/etc/puppetlabs/${container}/conf.d/activity-database.conf",
    setting => 'activity.database.user',
    value   => $database_user,
  }

  if !pe_empty($database_password) {
    pe_hocon_setting { 'activity.database.password':
      path    => "/etc/puppetlabs/${container}/conf.d/activity-database.conf",
      setting => 'activity.database.password',
      value   => $database_password,
    }
  }

  pe_hocon_setting { 'activity.database.maximum-pool-size':
    path    => "/etc/puppetlabs/${container}/conf.d/activity-database.conf",
    setting => "activity.database.maximum-pool-size",
    value   => $maximum_pool_size,
  }

  # Timeouts in this module are in seconds, but the services expect them in milliseconds
  pe_hocon_setting { 'activity.database.connection-timeout':
    path    => "/etc/puppetlabs/${container}/conf.d/activity-database.conf",
    setting => "activity.database.connection-timeout",
    value   => $pool_timeout * 1000,
  }

  # Timeouts in this module are in seconds, but the services expect them in milliseconds
  pe_hocon_setting { 'activity.database.connection-check-timeout':
    path    => "/etc/puppetlabs/${container}/conf.d/activity-database.conf",
    setting => "activity.database.connection-check-timeout",
    value   => $pool_check_timeout * 1000,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  puppet_enterprise::trapperkeeper::bootstrap_cfg { "${container}:activity activity-service" :
    container => $container,
    namespace => 'puppetlabs.activity.services',
    service   => 'activity-service',
  }

  puppet_enterprise::trapperkeeper::bootstrap_cfg { "${container}:activity jetty9-service" :
    container => $container,
    namespace => 'puppetlabs.trapperkeeper.services.webserver.jetty9-service',
    service   => 'jetty9-service',
  }
}
