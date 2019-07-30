class puppet_enterprise::master::code_manager(
<<<<<<< HEAD
  String $certname                              = $facts['clientcert'],
  String $webserver_ssl_host                    = '0.0.0.0',
  Integer $webserver_ssl_port                   = 8170,
  Array[String] $ssl_protocols                  = $puppet_enterprise::ssl_protocols,
=======
  String $certname                              = $::clientcert,
  String $webserver_ssl_host                    = '0.0.0.0',
  Integer $webserver_ssl_port                   = 8170,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  String $hostcrl                               = $puppet_enterprise::params::hostcrl,
  String $localcacert                           = $puppet_enterprise::params::localcacert,
  String $datadir                               = '/opt/puppetlabs/server/data/code-manager/',
  String $cachedir                              = '/opt/puppetlabs/server/data/code-manager/cache',
<<<<<<< HEAD
  Optional[Boolean] $file_sync_auto_commit      = undef,
  Optional[String] $file_sync_repo_id           = undef,
=======
  String $file_sync_repo_id                     = 'puppet-code',
  Boolean $file_sync_auto_commit                = true,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  Boolean $authenticate_webhook                 = true,
  Integer $deploy_pool_size                     = 2,
  Integer $timeouts_fetch                       = 30,
  Integer $timeouts_deploy                      = 600,
  Integer $timeouts_hook                        = 30,
  Integer $timeouts_shutdown                    = 610,
  Integer $timeouts_wait                        = 700,
<<<<<<< HEAD
  Integer $timeouts_sync                        = 60,
  Optional[Array[String]] $purge_whitelist      = ['.resource_types'],
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  Optional[String] $environmentdir              = undef,
  Optional[Hash] $forge_settings                = undef,
  Optional[Hash] $git_settings                  = undef,
  Optional[Hash] $sources                       = undef,
  Optional[String] $invalid_branches            = undef,
  Optional[String] $remote                      = undef,
  Optional[String] $proxy                       = undef,
  Optional[String] $private_key                 = undef,
  Optional[Array[Hash]] $post_environment_hooks = undef,
<<<<<<< HEAD
  Integer $puppet_master_port                   = $puppet_enterprise::puppet_master_port,
  Optional[Enum['rugged', 'shellgit']] $git_provider = undef,
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
) inherits puppet_enterprise::params {

  $confdir = '/etc/puppetlabs/puppetserver'

<<<<<<< HEAD
  if ($file_sync_repo_id != undef) {
    warning('Deprecation: $puppet_enterprise::master::code_manager::file_sync_repo_id is deprecated and will be ignored')
  }

  if ($file_sync_auto_commit != undef) {
    warning('Deprecation: $puppet_enterprise::master::code_manager::file_sync_auto_commit is deprecated and will be ignored')
  }

  $code_manager_service = 'code-manager-v1'
  if !pe_empty($environmentdir) {
    $_environmentdir = $environmentdir
  }
  else {
      $_environmentdir = '/etc/puppetlabs/code-staging/environments'
=======
  if $file_sync_auto_commit {
    $code_manager_service = 'code-manager-v1'
    if !pe_empty($environmentdir) {
      $_environmentdir = $environmentdir
    } else {
      $_environmentdir = '/etc/puppetlabs/code-staging/environments'
    }
  } else {
    $code_manager_service = 'code-manager-v1-no-file-sync'
    if !pe_empty($environmentdir) {
      $_environmentdir = $environmentdir
    } else {
      $_environmentdir = '/etc/puppetlabs/code/environments'
    }
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  $web_router_section = "web-router-service.\"puppetlabs.code-manager.services/${code_manager_service}\""

  if !pe_empty($sources) {
      pe_validate_hash($sources)
      $_sources = $sources
  }
  elsif !pe_empty($remote) {
    $_sources = {
      'puppet' => {
        'remote' => $remote,
      },
    }
  }
  else {
    $_sources = undef
  }

  Pe_hocon_setting {
    ensure => present,
<<<<<<< HEAD
    notify => Service['pe-puppetserver'],
=======
    notify => Service["pe-puppetserver"],
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  File {
    ensure => present,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
    mode   => '0640',
  }

  file { $datadir :
    ensure => directory,
    mode   => '0640',
  }

  file { "${confdir}/conf.d/code-manager.conf" :
    ensure => present,
  }

  puppet_enterprise::trapperkeeper::bootstrap_cfg { $code_manager_service :
    container => 'puppetserver',
    namespace => 'puppetlabs.code-manager.services',
  }

<<<<<<< HEAD
=======
  puppet_enterprise::trapperkeeper::bootstrap_cfg {'remote-rbac-consumer-service' :
    container => 'puppetserver',
    namespace => 'puppetlabs.rbac-client.services.rbac',
  }

>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  puppet_enterprise::trapperkeeper::bootstrap_cfg { 'remote-activity-reporter' :
    container => 'puppetserver',
    namespace => 'puppetlabs.rbac-client.services.activity',
  }

<<<<<<< HEAD
  puppet_enterprise::trapperkeeper::webserver_settings { 'code-manager' :
    container          => 'puppetserver',
    certname           => $certname,
    ssl_listen_address => $webserver_ssl_host,
    ssl_listen_port    => $webserver_ssl_port,
    localcacert        => $localcacert,
    hostcrl            => $hostcrl,
    access_log_config  => "${confdir}/code-manager-request-logging.xml",
    ssl_protocols      => $ssl_protocols,
  }

=======
  pe_hocon_setting{ 'webserver.code-manager.client-auth':
    path    => "${confdir}/conf.d/webserver.conf",
    setting => 'webserver.code-manager.client-auth',
    value   => 'want',
  }
  pe_hocon_setting{ 'webserver.code-manager.ssl-host':
    path    => "${confdir}/conf.d/webserver.conf",
    setting => 'webserver.code-manager.ssl-host',
    value   => $webserver_ssl_host,
  }
  pe_hocon_setting{ 'webserver.code-manager.ssl-port':
    path    => "${confdir}/conf.d/webserver.conf",
    setting => 'webserver.code-manager.ssl-port',
    value   => $webserver_ssl_port
  }
  pe_hocon_setting{ 'webserver.code-manager.ssl-cert':
    path    => "${confdir}/conf.d/webserver.conf",
    setting => 'webserver.code-manager.ssl-cert',
    value   => "/etc/puppetlabs/puppet/ssl/certs/${certname}.pem",
  }
  pe_hocon_setting{ 'webserver.code-manager.ssl-key':
    path    => "${confdir}/conf.d/webserver.conf",
    setting => 'webserver.code-manager.ssl-key',
    value   => "/etc/puppetlabs/puppet/ssl/private_keys/${certname}.pem",
  }
  pe_hocon_setting{ 'webserver.code-manager.ssl-ca-cert':
    path    => "${confdir}/conf.d/webserver.conf",
    setting => 'webserver.code-manager.ssl-ca-cert',
    value   => $localcacert,
  }
  pe_hocon_setting{ 'webserver.code-manager.ssl-crl-path':
    path    => "${confdir}/conf.d/webserver.conf",
    setting => 'webserver.code-manager.ssl-crl-path',
    value   => $hostcrl,
  }
  pe_hocon_setting{ 'webserver.code-manager.access-log-config':
    path    => "${confdir}/conf.d/webserver.conf",
    setting => 'webserver.code-manager.access-log-config',
    value   => "${confdir}/request-logging.xml",
  }
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  pe_hocon_setting { "${web_router_section}.route":
    path    => "${confdir}/conf.d/web-routes.conf",
    setting => "${web_router_section}.route",
    value   => '/code-manager/v1',
  }
  pe_hocon_setting { "${web_router_section}.server":
    path    => "${confdir}/conf.d/web-routes.conf",
    setting => "${web_router_section}.server",
    value   => 'code-manager',
  }

  pe_hocon_setting{ 'code-manager.file-sync.repo-id':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.file-sync.repo-id',
<<<<<<< HEAD
    value   => 'puppet-code',
=======
    value   => $file_sync_repo_id,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  pe_hocon_setting{ 'code-manager.environmentdir':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.environmentdir',
    value   => $_environmentdir,
  }
  pe_hocon_setting{ 'code-manager.datadir':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.datadir',
    value   => $datadir,
  }
  pe_hocon_setting{ 'code-manager.cachedir':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.cachedir',
    value   => $cachedir,
  }
  pe_hocon_setting{ 'code-manager.authenticate-webhook':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.authenticate-webhook',
    value   => $authenticate_webhook,
  }
  pe_hocon_setting{ 'code-manager.deploy-pool-size':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.deploy-pool-size',
    value   => $deploy_pool_size,
  }
  pe_hocon_setting{ 'code-manager.timeouts.fetch':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.timeouts.fetch',
    value   => $timeouts_fetch,
  }
  pe_hocon_setting{ 'code-manager.timeouts.deploy':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.timeouts.deploy',
    value   => $timeouts_deploy,
  }
  pe_hocon_setting{ 'code-manager.timeouts.hook':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.timeouts.hook',
    value   => $timeouts_hook,
  }
  pe_hocon_setting{ 'code-manager.timeouts.shutdown':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.timeouts.shutdown',
    value   => $timeouts_shutdown,
  }
  pe_hocon_setting{ 'code-manager.timeouts.wait':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.timeouts.wait',
    value   => $timeouts_wait,
  }
<<<<<<< HEAD
  pe_hocon_setting{ 'code-manager.timeouts.sync':
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.timeouts.sync',
    value   => $timeouts_sync,
  }

  if pe_empty($purge_whitelist) {
    $purge_whitelist_ensure = 'absent'
  } else {
    $purge_whitelist_ensure = 'present'
  }

  pe_hocon_setting { 'code-manager.purge-whitelist':
    ensure  => $purge_whitelist_ensure,
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.purge-whitelist',
    type    => 'array',
    value   => $purge_whitelist,
  }
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547

  if pe_empty($proxy) {
    $proxy_ensure = absent
  } else {
    $proxy_ensure = present
  }
  pe_hocon_setting { 'code-manager.proxy':
    ensure  => $proxy_ensure,
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.proxy',
    value   => $proxy,
  }

  if pe_empty($post_environment_hooks) {
    $post_environment_hooks_ensure = absent
  } else {
    $post_environment_hooks_ensure = present
  }
  pe_hocon_setting { 'code-manager.hooks.post-environment':
    ensure  => $post_environment_hooks_ensure,
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.hooks.post-environment',
    type    => 'array',
    value   => $post_environment_hooks,
  }

  if pe_empty($forge_settings) {
    $forge_settings_ensure = absent
  } else {
    $forge_settings_ensure = present
  }
  pe_hocon_setting{ 'code-manager.forge':
    ensure  => $forge_settings_ensure,
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.forge',
    value   => $forge_settings,
  }
  # PE 2015.3.0 and 2015.3.1 set this invalid setting.
  pe_hocon_setting{ 'code-manager.forge-settings':
    ensure  => absent,
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.forge-settings',
  }

  if pe_empty($_sources) {
    $sources_ensure = absent
  } else {
    $sources_ensure = present
  }
  pe_hocon_setting{ 'code-manager.sources':
    ensure  => $sources_ensure,
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.sources',
    value   => $_sources,
  }

  if pe_empty($invalid_branches) {
    $invalid_branches_ensure = absent
  } else {
    $invalid_branches_ensure = present
  }

  pe_hocon_setting{ 'code-manager.invalid-branches':
    ensure  => $invalid_branches_ensure,
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.invalid-branches',
    value   => $invalid_branches,
  }

  if pe_empty($git_settings) {
    if pe_empty($private_key) {
      $git_ensure = absent
      $_git = undef
    } else {
      $git_ensure = present
      $_git = { 'private-key' => $private_key }
  }} else {
    if pe_empty($private_key) {
      $_git = $git_settings
      $git_ensure = present
    } else {
<<<<<<< HEAD
      fail('Both private_key and git_settings provided to puppet_enterprise::master::code-manager.')
    }
  }
=======
      fail("Both private_key and git_settings provided to puppet_enterprise::master::code-manager.")
  }}
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547

  pe_hocon_setting{ 'code-manager.git':
    ensure  => $git_ensure,
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.git',
    value   => $_git,
  }

<<<<<<< HEAD
  unless pe_empty($git_provider) {
    pe_hocon_setting{ 'code-manager.git-provider':
      ensure  => 'present',
      path    => "${confdir}/conf.d/code-manager.conf",
      setting => 'code-manager.git-provider',
      value   => $git_provider,
    }
  }

=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  # This setting is deprecated
  pe_hocon_setting {'code-manager.private-key':
    ensure  => absent,
    path    => "${confdir}/conf.d/code-manager.conf",
    setting => 'code-manager.private-key',
  }

}
