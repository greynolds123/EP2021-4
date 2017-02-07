node default {
  class {'puppet_enterprise':
    certificate_authority_host   => 'ca.rspec',
    puppet_master_host           => 'master.rspec',
    console_host                 => 'console.rspec',
    puppetdb_host                => 'puppetdb.rspec',
    database_host                => 'database.rspec',
    mcollective_middleware_hosts => ['mco.rspec'],
    pcp_broker_host              => 'pcp_broker.rspec',
  }
}
