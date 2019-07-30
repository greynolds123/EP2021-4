# This class is for managing the configuration file for PuppetDB's Trapperkeeper
# jetty instance.
#
# @param certname [String] Name of the clients certificate
# @param cert_whitelist_path [String] Path to the certificate-whitelist file
# @param confdir [String] The path to PuppetDB's confdir
# @param listen_address [String] The address which the database is listening on
#        for plain text connections
# @param listen_port [Integer] The port which PuppetDB Listens on for plain text connections
# @param localcacert [String] The path to the local CA certificate
# @param ssl_dir [String] The directory where Puppet's ssl directory
# @param ssl_listen_address [String] The address which the database is
#        listening on for SSL connections
# @param ssl_listen_port [Integer] The port which PuppetDB Listens on for SSL connections
<<<<<<< HEAD
# @param ssl_protocols [Array[String]] The list of SSL protocols to allow.
# @param cipher_suites [Optional[String]] An optional list of cipher suites to
#        be used by puppetdb during ssl communications. If left undef the JDK defaults
#        will be used.  This parameter existed before ssl_cipher_suites was added
#        to puppet_enterprise so we leave this parameter as a string instead of
#        an array.
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
# @param tk_jetty_max_threads [Integer] The maximum number of threads that
#        Trapperkeeper's Jetty server can spin up.
# @param tk_jetty_request-header_max_size [Integer] Sets the maximum size of an HTTP Request Header.
class puppet_enterprise::puppetdb::jetty_ini(
<<<<<<< HEAD
  $cert_whitelist_path,
  $certname                         = $puppet_enterprise::puppetdb::certname,
=======
  $certname,
  $cert_whitelist_path,
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  $confdir                          = $puppet_enterprise::params::puppetdb_confdir,
  $listen_address                   = $puppet_enterprise::params::plaintext_address,
  $listen_port                      = $puppet_enterprise::params::puppetdb_listen_port,
  $localcacert                      = $puppet_enterprise::params::localcacert,
  $ssl_dir                          = $puppet_enterprise::params::puppetdb_ssl_dir,
  $ssl_listen_address               = $puppet_enterprise::params::ssl_address,
  $ssl_listen_port                  = $puppet_enterprise::params::puppetdb_ssl_listen_port,
<<<<<<< HEAD
  Array[String] $ssl_protocols      = $puppet_enterprise::ssl_protocols,
  Optional[String] $cipher_suites   = pe_join($puppet_enterprise::ssl_cipher_suites, ','),
  $tk_jetty_max_threads             = undef,
  $tk_jetty_request_header_max_size = 65536,
) inherits puppet_enterprise::params {
  include puppet_enterprise::packages
=======
  $tk_jetty_max_threads             = undef,
  $tk_jetty_request_header_max_size = 65536,
) inherits puppet_enterprise::params {
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547

  file { "${confdir}/jetty.ini":
    ensure  => present,
    owner   => 'pe-puppetdb',
    group   => 'pe-puppetdb',
    mode    => '0640',
    require => Package['pe-puppetdb']
  }

  #Set the defaults
  Pe_ini_setting {
    ensure  => present,
    path    => "${confdir}/jetty.ini",
    section => 'jetty',
    require => File["${confdir}/jetty.ini"]
  }

  if pe_empty($listen_port) {
    pe_ini_setting {'puppetdb_host':
      ensure  => absent,
      setting => 'host',
    }
    pe_ini_setting {'puppetdb_port':
      ensure  => absent,
      setting => 'port',
    }
  } else {
    pe_ini_setting {'puppetdb_host':
      setting => 'host',
      value   => $listen_address,
    }

    pe_ini_setting {'puppetdb_port':
      setting => 'port',
      value   => $listen_port,
    }
  }

  pe_ini_setting {'puppetdb_sslhost':
    setting => 'ssl-host',
    value   => $ssl_listen_address,
  }

  pe_ini_setting {'puppetdb_sslport':
    setting => 'ssl-port',
    value   => $ssl_listen_port,
  }

<<<<<<< HEAD
  $cipher_suites_ensure = pe_empty($cipher_suites) ? {
    true => absent,
    false => present,
  }

  pe_ini_setting {'puppetdb_cipher_suites':
    ensure  => $cipher_suites_ensure,
    setting => 'cipher-suites',
    value   => $cipher_suites,
  }

=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  pe_ini_setting {'puppetdb_ssl_key':
    setting => 'ssl-key',
    value   => "${ssl_dir}/${certname}.private_key.pem",
  }

  pe_ini_setting {'puppetdb_ssl_cert':
    setting => 'ssl-cert',
    value   => "${ssl_dir}/${certname}.cert.pem",
  }

  pe_ini_setting {'puppetdb_ssl_ca_cert':
    setting => 'ssl-ca-cert',
    value   => $localcacert,
  }

  pe_ini_setting {'puppetdb_client_auth':
    setting => 'client-auth',
    value   => 'want',
  }

<<<<<<< HEAD
  pe_ini_setting { 'puppetdb_ssl_protocols':
    setting => 'ssl-protocols',
    value => pe_join($ssl_protocols, ','),
  }

=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  pe_ini_setting { 'puppetdb-certificate-whitelist':
    section => 'puppetdb',
    setting => 'certificate-whitelist',
    value   => $cert_whitelist_path,
    require => File[$cert_whitelist_path],
  }

<<<<<<< HEAD

=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  if $tk_jetty_max_threads != undef {
    pe_ini_setting {'puppetdb_max-threads':
      setting => 'max-threads',
      value   => $tk_jetty_max_threads,
    }
  }

  pe_ini_setting {'puppetdb_request_header_max_size':
    setting => 'request-header-max-size',
    value   => $tk_jetty_request_header_max_size,
  }
}
