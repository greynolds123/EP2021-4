# This file was automatically generated on 2019-06-08 13:59:54 -0700.
# Use the 'puppet generate types' command to regenerate this file.

Puppet::Resource::ResourceType3.new(
  'zabbix_host',
  [
    # The basic property that the resource should be in.
    # 
    # Valid values are `present`, `absent`.
    Puppet::Resource::Param(Enum['present', 'absent'], 'ensure')
  ],
  [
    # FQDN of the machine.
    Puppet::Resource::Param(Any, 'hostname', true),

    # The IP address of the machine running zabbix agent.
    Puppet::Resource::Param(Any, 'ipaddress'),

    # Using ipadress instead of dns to connect. Is used by the zabbix-api command.
    Puppet::Resource::Param(Any, 'use_ip'),

    # The port that the zabbix agent is listening on.
    Puppet::Resource::Param(Any, 'port'),

    # Name of the hostgroup.
    Puppet::Resource::Param(Any, 'group'),

    # Create hostgroup if missing.
    Puppet::Resource::Param(Any, 'group_create'),

    # List of templates which should be loaded for this host.
    Puppet::Resource::Param(Any, 'templates'),

    # Whether it is monitored by an proxy or not.
    Puppet::Resource::Param(Any, 'proxy'),

    # The url on which the zabbix-api is available.
    Puppet::Resource::Param(Any, 'zabbix_url'),

    # Zabbix-api username.
    Puppet::Resource::Param(Any, 'zabbix_user'),

    # Zabbix-api password.
    Puppet::Resource::Param(Any, 'zabbix_pass'),

    # If apache is uses with ssl
    Puppet::Resource::Param(Any, 'apache_use_ssl'),

    # The specific backend to use for this `zabbix_host`
    # resource. You will seldom need to specify this --- Puppet will usually
    # discover the appropriate provider for your platform.Available providers are:
    # 
    # ruby
    # :
    Puppet::Resource::Param(Any, 'provider')
  ],
  {
    /(?m-ix:(.*))/ => ['hostname']
  },
  true,
  false)
