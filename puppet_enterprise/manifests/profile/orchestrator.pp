# This profile sets up the Orchestrator service.
#
# @param certname [String] The name of the service SSL certificate.
# @param database_host [String] The hostname running PostgreSQL.
# @param database_port [Integer] The port that PostgreSQL is listening on.
# @param database_name [String] The name of the orchestrator database.
# @param database_user [String] The user account for the orchestrator database.
# @param ssl_listen_address [String] The network interface used for SSL connections.
# @param ssl_listen_port [Boolean] The port used for SSL connections.
<<<<<<< HEAD
# @param ssl_protocols [Array[String]] The list of SSL protocols to allow.
# @param pcp_listen_port [Boolean] The port used for PCP connections.
# @param master_host [String] The hostname of the Puppet Master.
# @param master_port [Integer] The port of the Puppet Master.
# @param puppetdb_host Array[String] The hostname of the PuppetDB server.
# @param puppetdb_port Array[Integer] The port for the PuppetDB Servers
# @param rbac_host [String] The hostname of the RBAC service.
# @param rbac_port [String] The port of the RBAC service.
# @param rbac_prefix [String] The URL prefix of the RBAC service.
# @param activity_host [String] The hostname of the activity service.
# @param activity_port [String] The port of the activity service.
# @param activity_prefix [String] The URL prefix of the activity service.
# @param run_service [Boolean] Should pe-orchestration-services be running
# @param global_concurrent_compiles [Integer] The maximum number of Puppet runs to allow at once, across all jobs.
# @param task_concurrency [Integer] The maximum number of task runs to allow at once, across all jobs.
# @param bolt_server_max_connections [Integer] The maximum number of connections to bolt-server to allow at once, across all jobs.
# @param plan_executor_workers [Integer] The number of processes to create for the plan-executor app
# @param job_prune_threshold [Integer] The length of time in days that job history should be retained.
# @param use_application_services [Boolean] Whether to enable application management features in orchestrator.
# @param allow_unauthenticated_status [Boolean] True allows unauthenticated access, by default. False requires authentication on the orchestrator status-service endpoint.
# @param ace_server_max_connections [Integer] The maximum number of connections to ace-server to allow at once, across all jobs.
class puppet_enterprise::profile::orchestrator(
  $certname                                     = $facts['clientcert'],
  $database_host                                = $puppet_enterprise::orchestrator_database_host,
  $database_port                                = $puppet_enterprise::database_port,
  $database_name                                = $puppet_enterprise::orchestrator_database_name,
  $database_user                                = $puppet_enterprise::orchestrator_service_regular_db_user,
  $database_migration_user                      = $puppet_enterprise::orchestrator_service_migration_db_user,
  $database_password                            = $puppet_enterprise::orchestrator_database_password,
  $database_properties                          = $puppet_enterprise::database_properties,
  $ssl_listen_address                           = $puppet_enterprise::params::ssl_address,
  $ssl_listen_port                              = $puppet_enterprise::orchestrator_port,
  Array[String] $ssl_protocols                  = $puppet_enterprise::ssl_protocols,
  $master_host                                  = $puppet_enterprise::puppet_master_host,
  Integer $master_port                          = $puppet_enterprise::puppet_master_port,
  Array[String]  $puppetdb_host                 = $puppet_enterprise::puppetdb_hosts_array,
  Array[Integer] $puppetdb_port                 = $puppet_enterprise::puppetdb_ports_array,
=======
# @param pcp_listen_port [Boolean] The port used for PCP connections.
# @param master_host [String] The hostname of the Puppet Master.
# @param puppetdb_host [String] The hostname of the PuppetDB server.
# @param rbac_host [String] The hostname of the RBAC service.
# @param rbac_port [String] The port of the RBAC service.
# @param rbac_prefix [String] The URL prefix of the RBAC service.
# @param run_service [Boolean] Should pe-orchestration-services be running
# @param job_prune_threshold [Integer] The length of time in days that job history should be retained.
# @param use_application_services [Boolean] Deprecated.
class puppet_enterprise::profile::orchestrator(
  $certname                                     = $::clientcert,
  $database_host                                = $puppet_enterprise::database_host,
  $database_port                                = $puppet_enterprise::database_port,
  $database_name                                = $puppet_enterprise::orchestrator_database_name,
  $database_user                                = $puppet_enterprise::orchestrator_database_user,
  $database_password                            = $puppet_enterprise::orchestrator_database_password,
  $database_properties                          = $puppet_enterprise::database_properties,
  $ssl_listen_address                           = $puppet_enterprise::params::ssl_address,
  $ssl_listen_port                              = 8143,
  $master_host                                  = $puppet_enterprise::puppet_master_host,
  $puppetdb_host                                = $puppet_enterprise::puppetdb_host,
  $puppetdb_port                                = $puppet_enterprise::puppetdb_port,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  $classifier_host                              = $puppet_enterprise::console_host,
  $classifier_port                              = $puppet_enterprise::api_port,
  $classifier_prefix                            = $puppet_enterprise::classifier_url_prefix,
  $rbac_host                                    = $puppet_enterprise::console_host,
  $rbac_port                                    = $puppet_enterprise::api_port,
  $rbac_prefix                                  = $puppet_enterprise::rbac_url_prefix,
<<<<<<< HEAD
  $activity_host                                = $puppet_enterprise::console_host,
  $activity_port                                = $puppet_enterprise::api_port,
  $activity_prefix                              = $puppet_enterprise::activity_url_prefix,
  $console_host                                 = $puppet_enterprise::console_host,
  $console_services_host                        = $puppet_enterprise::console_host,
  $console_services_port                        = $puppet_enterprise::api_port,
  Integer $inventory_port                       = $puppet_enterprise::orchestrator_port,
  String $inventory_prefix                      = $puppet_enterprise::inventory_url_prefix,
=======
  $console_host                                 = $puppet_enterprise::console_host,
  $console_services_host                        = $puppet_enterprise::console_host,
  $console_services_port                        = $puppet_enterprise::params::console_services_api_ssl_listen_port,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  $pcp_listen_port                              = $puppet_enterprise::pcp_broker_port,
  $pcp_accept_consumers                         = $puppet_enterprise::params::pcp_broker_accept_consumers,
  $pcp_delivery_consumers                       = $puppet_enterprise::params::pcp_broker_delivery_consumers,
  $run_service                                  = true,
  Optional[Integer] $pcp_timeout                = undef,
  Optional[Integer] $global_concurrent_compiles = undef,
<<<<<<< HEAD
  Optional[Integer] $task_concurrency           = undef,
  Integer $bolt_server_max_connections          = $puppet_enterprise::bolt_server_concurrency,
  Integer $plan_executor_workers                = $puppet_enterprise::plan_executor_workers,
  Optional[Integer] $job_prune_threshold        = undef,
  Hash $java_args                               = $puppet_enterprise::params::orchestrator_java_args,
  Optional[Boolean] $enable_gc_logging          = undef,
  $use_application_services                     = $puppet_enterprise::use_application_services,
  Boolean $allow_unauthenticated_status         = $puppet_enterprise::allow_unauthenticated_status,
  Integer $ace_server_max_connections           = $puppet_enterprise::ace_server_concurrency,
) {
  include puppet_enterprise::packages
=======
  Optional[Integer] $job_prune_threshold        = undef,
  Hash $java_args                               = $puppet_enterprise::params::orchestrator_java_args,
  $use_application_services                     = undef,
) {

  if ($use_application_services != undef) {
    warning('Deprecation: $puppet_enterprise::profile::orchestrator::use_application_services is deprecated and will be ignored')
  }
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547

  File {
    mode => '0644',
  }

  $container = 'orchestration-services'
  Package <| tag == 'pe-orchestrator-packages' |> {
<<<<<<< HEAD
    before => [Puppet_enterprise::Trapperkeeper::Orchestrator[$container],
               Puppet_enterprise::Trapperkeeper::Pcp_broker[$container],
               Class[puppet_enterprise::trapperkeeper::inventory],
               Class[puppet_enterprise::profile::plan_executor]]
=======
    before => Puppet_enterprise::Trapperkeeper::Orchestrator[$container]
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  $client_certname = $puppet_enterprise::puppet_master_host

<<<<<<< HEAD
  # For PuppetDB HA, a user may pass in an Array to specify their PuppetDBs
  $first_puppetdb_host = $puppetdb_host[0]
  $first_puppetdb_port = pe_any2array($puppetdb_port)[0]

  $orch_ssl_dir = "/etc/puppetlabs/${container}/ssl"
  $client_pk8_key  =  "${orch_ssl_dir}/${certname}.private_key.pk8"
  $client_pem_key  =  "${orch_ssl_dir}/${certname}.private_key.pem"
  $client_cert     =  "${orch_ssl_dir}/${certname}.cert.pem"
  $puppetdb_url    =  "https://${first_puppetdb_host}:${first_puppetdb_port}"
=======
  $orch_ssl_dir = "/etc/puppetlabs/${container}/ssl"
  $client_pk8_key  =  "${orch_ssl_dir}/${certname}.private_key.pk8"
  $client_pem_key  =  "/etc/puppetlabs/puppet/ssl/private_keys/${certname}.pem"
  $client_cert     =  "/etc/puppetlabs/puppet/ssl/certs/${certname}.pem"
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547

  if $puppet_enterprise::database_ssl and $puppet_enterprise::database_cert_auth {
    $ssl_database_properties = "${database_properties}&sslkey=${client_pk8_key}&sslcert=${client_cert}"
  } else {
    $ssl_database_properties = $database_properties
  }

<<<<<<< HEAD
  if $settings::storeconfigs {
    $pcp_brokers = puppetdb_query("nodes[certname] { resources { type = 'Class' and title = 'Puppet_enterprise::Master::Pcp_broker' } and deactivated is null order by certname }").map |$node| { $node['certname'] }
  } else {
    $pcp_brokers = []
  }

  puppet_enterprise::trapperkeeper::orchestrator { $container:
    database_host                => $database_host,
    database_port                => $database_port,
    database_name                => $database_name,
    database_user                => $database_user,
    database_migration_user      => $database_migration_user,
    database_password            => $database_password,
    database_properties          => $ssl_database_properties,
    master_url                   => "https://${master_host}:${master_port}",
    puppetdb_url                 => $puppetdb_url,
    classifier_url               => "https://${classifier_host}:${classifier_port}${classifier_prefix}",
    console_services_url         => "https://${console_services_host}:${console_services_port}",
    rbac_url                     => "https://${rbac_host}:${rbac_port}${rbac_prefix}",
    activity_url                 => "https://${activity_host}:${activity_port}${activity_prefix}",
    console_url                  => "https://${console_host}",
    inventory_service_url        => "https://${master_host}:${inventory_port}${inventory_prefix}",
    pcp_brokers                  => $pcp_brokers,
    notify                       => Service["pe-${container}"],
    pcp_timeout                  => $pcp_timeout,
    global_concurrent_compiles   => $global_concurrent_compiles,
    task_concurrency             => $task_concurrency,
    bolt_server_max_connections  => $bolt_server_max_connections,
    plan_executor_workers        => $plan_executor_workers,
    job_prune_threshold          => $job_prune_threshold,
    app_management               => $use_application_services,
    allow_unauthenticated_status => $allow_unauthenticated_status,
    ace_server_max_connections   => $ace_server_max_connections,
=======
  # For PuppetDB HA, a user may pass in an Array to specify their PuppetDBs
  $first_puppetdb_host = pe_any2array($puppetdb_host)[0]
  $first_puppetdb_port = pe_any2array($puppetdb_port)[0]
  puppet_enterprise::trapperkeeper::orchestrator { $container:
    database_host               => $database_host,
    database_name               => $database_name,
    database_user               => $database_user,
    database_password           => $database_password,
    database_properties         => $ssl_database_properties,
    master_url                  => "https://${master_host}:8140",
    puppetdb_url                => "https://${first_puppetdb_host}:${first_puppetdb_port}",
    classifier_url              => "https://${classifier_host}:${classifier_port}${classifier_prefix}",
    console_services_url        => "https://${console_services_host}:${console_services_port}",
    rbac_url                    => "https://${rbac_host}:${rbac_port}${rbac_prefix}",
    pcp_broker_url              => "wss://${certname}:${pcp_listen_port}/pcp",
    console_url                 => "https://${console_host}",
    notify                      => Service["pe-${container}"],
    pcp_timeout                 => $pcp_timeout,
    global_concurrent_compiles  => $global_concurrent_compiles,
    job_prune_threshold         => $job_prune_threshold,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  puppet_enterprise::trapperkeeper::pcp_broker { $container:
    accept_consumers   => $pcp_accept_consumers,
    delivery_consumers => $pcp_delivery_consumers,
<<<<<<< HEAD
    controller_uris    => ["wss://${certname}:${ssl_listen_port}/server"],
    notify             => Service["pe-${container}"],
  }

  class { 'puppet_enterprise::trapperkeeper::inventory':
    database_properties     => $ssl_database_properties,
    puppetdb_url            => $puppetdb_url,
    client_pem_key          => $client_pem_key,
    client_cert             => $client_cert,
  }
  contain puppet_enterprise::trapperkeeper::inventory

=======
  }

>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  puppet_enterprise::trapperkeeper::bootstrap_cfg { "${container} webrouting-service":
    container => $container,
    namespace => 'puppetlabs.trapperkeeper.services.webrouting.webrouting-service',
    service   => 'webrouting-service',
<<<<<<< HEAD
  }

  puppet_enterprise::trapperkeeper::bootstrap_cfg { "${container}:pcp-broker metrics-service":
    container => $container,
    namespace => 'puppetlabs.trapperkeeper.services.metrics.metrics-service',
    service   => 'metrics-service',
  }

  puppet_enterprise::trapperkeeper::bootstrap_cfg { "${container}:pcp-broker metrics-webservice":
    container => $container,
    namespace => 'puppetlabs.trapperkeeper.services.metrics.metrics-service',
    service   => 'metrics-webservice',
  }

  puppet_enterprise::trapperkeeper::bootstrap_cfg { "${container}:pcp-broker scheduler-service" :
    container => $container,
    namespace => 'puppetlabs.trapperkeeper.services.scheduler.scheduler-service',
    service   => 'scheduler-service',
  }

  puppet_enterprise::trapperkeeper::bootstrap_cfg { "${container}:pcp-broker status-service" :
    container => $container,
    namespace => 'puppetlabs.trapperkeeper.services.status.status-service',
    service   => 'status-service',
  }

  $confdir = "/etc/puppetlabs/${container}/conf.d"

  file { "${confdir}/auth.conf":
    ensure => present,
    owner  => "pe-${container}",
    group  => "pe-${container}",
    mode   => '0640',
  }

  # Remove the old authorization.conf file laid down by previous
  # orchestration-services packages
  file { "${confdir}/authorization.conf":
    ensure => absent,
  }

  pe_hocon_setting { "${container}.authorization.version":
    path    => "${confdir}/auth.conf",
    setting => 'authorization.version',
    value   => 1,
  }

  file { "${confdir}/webserver.conf":
    ensure => present,
    owner  => "pe-${container}",
    group  => "pe-${container}",
    mode   => '0640',
  }

  $access_log_config = "/etc/puppetlabs/${container}/request-logging.xml"

  Pe_hocon_setting {
    ensure => present,
    path   => "${confdir}/webserver.conf",
    notify => Service["pe-${container}"],
  }

  puppet_enterprise::trapperkeeper::global_settings { $container :
    certname    => $client_certname,
    ssl_cert    => "/etc/puppetlabs/${container}/ssl/${client_certname}.cert.pem",
    ssl_key     => "/etc/puppetlabs/${container}/ssl/${client_certname}.private_key.pem",
    localcacert => $puppet_enterprise::params::localcacert,
  }

  puppet_enterprise::trapperkeeper::webserver_settings { 'pcp-broker' :
    container          => $container,
    ssl_listen_address => $ssl_listen_address,
    ssl_listen_port    => Integer($pcp_listen_port),
    ssl_cert           => "/etc/puppetlabs/${container}/ssl/${certname}.cert.pem",
    ssl_key            => "/etc/puppetlabs/${container}/ssl/${certname}.private_key.pem",
    ssl_protocols      => $ssl_protocols,
=======
    notify    => Service["pe-${container}"],
  }

  $confdir = "/etc/puppetlabs/${container}/conf.d"
  file { "${confdir}/webserver.conf":
    ensure => present,
    owner  => "pe-${container}",
    group  => "pe-${container}",
    mode   => '0640',
  }

  $log_config = "/etc/puppetlabs/${container}/logback.xml"
  $access_log_config = "/etc/puppetlabs/${container}/request-logging.xml"

  file { "${confdir}/global.conf":
    ensure => present,
  }

  pe_hocon_setting{ "${container}.global.logging-config":
    path    => "${confdir}/global.conf",
    setting => 'global.logging-config',
    value   => $log_config,
  }

  pe_hocon_setting { "${container}.global.certs.ssl-ca-cert":
    ensure  => present,
    path    => "${confdir}/global.conf",
    setting => 'global.certs.ssl-ca-cert',
    value   => $puppet_enterprise::params::localcacert,
  }

  pe_hocon_setting { "${container}.global.certs.ssl-cert":
    ensure  => present,
    path    => "${confdir}/global.conf",
    setting => 'global.certs.ssl-cert',
    value   => "/etc/puppetlabs/${container}/ssl/${client_certname}.cert.pem",
  }

  pe_hocon_setting { "${container}.global.certs.ssl-key":
    ensure  => present,
    path    => "${confdir}/global.conf",
    setting => 'global.certs.ssl-key',
    value   => "/etc/puppetlabs/${container}/ssl/${client_certname}.private_key.pem",
  }

  Pe_hocon_setting {
    ensure => present,
    path   => "${confdir}/webserver.conf",
    notify => Service["pe-${container}"]
  }

  pe_hocon_setting { "${container}.webserver.pcp-broker.client-auth":
    setting => 'webserver.pcp-broker.client-auth',
    value   => 'want',
  }

  pe_hocon_setting { "${container}.webserver.pcp-broker.ssl-host":
    setting => 'webserver.pcp-broker.ssl-host',
    value   => $ssl_listen_address,
  }

  pe_hocon_setting { "${container}.webserver.pcp-broker.ssl-port":
    setting => 'webserver.pcp-broker.ssl-port',
    value   => $pcp_listen_port,
  }

  pe_hocon_setting { "${container}.webserver.pcp-broker.ssl-ca-cert":
    setting => 'webserver.pcp-broker.ssl-ca-cert',
    value   => $puppet_enterprise::params::localcacert,
  }

  pe_hocon_setting { "${container}.webserver.pcp-broker.ssl-cert":
    setting => 'webserver.pcp-broker.ssl-cert',
    value   => "/etc/puppetlabs/${container}/ssl/${certname}.cert.pem",
  }

  pe_hocon_setting { "${container}.webserver.pcp-broker.ssl-key":
    setting => 'webserver.pcp-broker.ssl-key',
    value   => "/etc/puppetlabs/${container}/ssl/${certname}.private_key.pem",
  }

  pe_hocon_setting{ "${container}.webserver.pcp-broker.ssl-crl-path":
    setting => 'webserver.pcp-broker.ssl-crl-path',
    value   => $puppet_enterprise::params::hostcrl,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  pe_hocon_setting { "${container}.web-router-service.broker-service":
    path    => "/etc/puppetlabs/${container}/conf.d/web-routes.conf",
    setting => 'web-router-service."puppetlabs.pcp.broker.service/broker-service"',
    value   => {
<<<<<<< HEAD
=======
      # No longer used in pcp-broker 0.7.0. The websocket entry can be removed once we've
      # upgraded to pcp-broker 0.7+.
      'websocket' => {
        'route'   => '/pcp',
        'server'  => 'pcp-broker',
      },
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
      'v1'       => {
        'route'  => '/pcp',
        'server' => 'pcp-broker',
      },
<<<<<<< HEAD
      'v2'       => {
        'route'  => '/pcp2',
        'server' => 'pcp-broker',
      },
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
      'metrics'  => {
        'route'  => '/',
        'server' => 'pcp-broker',
      },
    },
  }

<<<<<<< HEAD
  puppet_enterprise::trapperkeeper::webserver_settings { 'orchestrator' :
    container          => $container,
    ssl_listen_address => $ssl_listen_address,
    ssl_listen_port    => Integer($ssl_listen_port),
    ssl_cert           => "/etc/puppetlabs/${container}/ssl/${certname}.cert.pem",
    ssl_key            => "/etc/puppetlabs/${container}/ssl/${certname}.private_key.pem",
    ssl_protocols      => $ssl_protocols,
    access_log_config  => $access_log_config,
    default_server     => true,
=======
  pe_hocon_setting { "${container}.webserver.orchestrator.client-auth":
    setting => 'webserver.orchestrator.client-auth',
    value   => 'want',
  }

  pe_hocon_setting { "${container}.webserver.orchestrator.access-log-config":
    setting => 'webserver.orchestrator.access-log-config',
    value   => $access_log_config,
  }

  pe_hocon_setting { "${container}.webserver.orchestrator.default-server":
    setting => 'webserver.orchestrator.default-server',
    value   => true,
  }

  pe_hocon_setting { "${container}.webserver.orchestrator.ssl-host":
    setting => 'webserver.orchestrator.ssl-host',
    value   => $ssl_listen_address,
  }

  pe_hocon_setting { "${container}.webserver.orchestrator.ssl-port":
    setting => 'webserver.orchestrator.ssl-port',
    value   => $ssl_listen_port,
  }

  pe_hocon_setting { "${container}.webserver.orchestrator.ssl-ca-cert":
    setting => 'webserver.orchestrator.ssl-ca-cert',
    value   => $puppet_enterprise::params::localcacert,
  }

  pe_hocon_setting { "${container}.webserver.orchestrator.ssl-cert":
    setting => 'webserver.orchestrator.ssl-cert',
    value   => "/etc/puppetlabs/${container}/ssl/${certname}.cert.pem",
  }

  pe_hocon_setting { "${container}.webserver.orchestrator.ssl-key":
    setting => 'webserver.orchestrator.ssl-key',
    value   => "/etc/puppetlabs/${container}/ssl/${certname}.private_key.pem",
  }

  pe_hocon_setting{ "${container}.webserver.orchestrator.ssl-crl-path":
    setting => 'webserver.orchestrator.ssl-crl-path',
    value   => $puppet_enterprise::params::hostcrl,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  pe_hocon_setting { "${container}.web-router-service.orchestrator-service":
    path    => "/etc/puppetlabs/${container}/conf.d/web-routes.conf",
    setting => 'web-router-service."puppetlabs.orchestrator.service/orchestrator-service"',
    value   => { route => '/orchestrator/v1', server => 'orchestrator' },
  }

<<<<<<< HEAD
  pe_hocon_setting { "${container}.web-router-service.orchestrator-dispatch-service":
    path    => "/etc/puppetlabs/${container}/conf.d/web-routes.conf",
    setting => 'web-router-service."puppetlabs.orchestrator.dispatch/orchestrator-dispatch-service"',
    value   => { route => '/server', server => 'orchestrator' },
  }

=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  pe_hocon_setting { "${container}.web-router-service.status-service":
    path    => "/etc/puppetlabs/${container}/conf.d/web-routes.conf",
    setting => 'web-router-service."puppetlabs.trapperkeeper.services.status.status-service/status-service"',
    value   => { route => '/status', server => 'orchestrator' },
  }

<<<<<<< HEAD
  pe_hocon_setting { "${container}.web-router-service.metrics-webservice":
    path    => "/etc/puppetlabs/${container}/conf.d/web-routes.conf",
    setting => 'web-router-service."puppetlabs.trapperkeeper.services.metrics.metrics-service/metrics-webservice"',
    value   => { 'route' => '/metrics', 'server' => 'orchestrator' },
  }

  puppet_enterprise::certs { $container:
    certname => $client_certname,
    cert_dir => $orch_ssl_dir,
    container => $container,
    make_pk8_cert => true,
=======
  file { $orch_ssl_dir:
    ensure => directory,
    mode   => '0600',
    owner  => "pe-${container}",
    group  => "pe-${container}",
  }

  puppet_enterprise::certs { $client_certname:
    certname => $client_certname,
    cert_dir => "/etc/puppetlabs/${container}/ssl",
    owner    => "pe-${container}",
    group    => "pe-${container}",
    notify   => Service["pe-${container}"],
    require  => File[$orch_ssl_dir],
  }

  puppet_enterprise::certs::pk8_cert { $client_pk8_key:
    pem_file => $client_pem_key,
    owner    => "pe-${container}",
    group    => "pe-${container}",
    mode     => '0400',
    notify   => Service["pe-${container}"],
    require  => File[$orch_ssl_dir],
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  puppet_enterprise::trapperkeeper::java_args { $container :
    java_args => $java_args,
<<<<<<< HEAD
    enable_gc_logging => $enable_gc_logging,
  }

  $_orchestrator_service_ensure = $run_service ? { true => 'running', false => 'stopped'}
  puppet_enterprise::trapperkeeper::pe_service { $container :
    ensure => $_orchestrator_service_ensure,
    enable => $run_service,
  }

  include puppet_enterprise::profile::bolt_server
  include puppet_enterprise::profile::plan_executor
  include puppet_enterprise::profile::ace_server
=======
  }

  service { "pe-${container}":
    ensure => $run_service,
    enable => $run_service,
  }
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
}
