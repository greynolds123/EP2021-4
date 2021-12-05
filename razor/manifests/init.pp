<<<<<<< HEAD
# Class: razor
#
# Parameters:
#
# [*servername*]: the DNS name or IP address of the Razor server (default: `$fqdn`)
# [*libarchive*]: the name of the libarchive package.  (default: autodetect)
# [*tftp*]: should TFTP services be installed and configured on this machine? (default: true)
#
# Actions:
#
#   Installs and runs the razor-server, along with all dependencies.
#
# Usage:
#
#   include razor
#
class razor (
  $servername = $fqdn,
  $libarchive = undef,
  $tftp       = true
) {
  # Ensure libarchive is installed -- the users requested custom version, or
  # our own guesswork as to what the version is on this platform.
  if $libarchive {
    package { $libarchive: ensure => latest }
  } else {
    include razor::libarchive
  }

  package { "unzip": ensure => latest }
  package { "curl":  ensure => latest }

  # Install a JVM, since we need one
  include 'java'
  Class[java] -> Class[Razor::TorqueBox]

  # Install our own TorqueBox bundle, quietly.  This isn't intended to be
  # shared with anyone else, so we don't use a standard module.
  include 'razor::torquebox'

  # Once that is installed, we also need to install the server software.
  include 'razor::server'
  Class[Razor::Torquebox] -> Class[Razor::Server]

  if $tftp {
    class { 'razor::tftp':
      server => $servername
    }
  }
=======
# == Class: razor
#
# Main class for Razor Provisioning
#
# === Parameters
# * enable_client (boolean): Whether to install/configure Razor Client
# * enable_db (boolean): Whether to configure Postgres DB for Razor
# * enable_server (boolean): Whether to install/configure Razor Server
# * enable_tftp (boolean): Whether to retrieve and "export" bootfiles to PXE Server
# * compile_microkernel (boolean): Whether to create new Microkernel for Razor
# * client_package_name (string): See Params
# * client_package_version (string): Package version for Razor Client (Default: 'latest')
# * database_hostname (string): Hostname for Postgres DB (Default: 'localhost')
# * database_name (string): Database name for Postgres DB (Default: 'razor_prod')
# * database_username (string): Username for Postgres DB (Default: 'razor')
# * database_password (string): Password for Postgres DB. REQUIRED (*)
# * server_package_name (string): See Params
# * server_package_version (string): Package version for Razor Server (Default: 'latest')
# * server_config_file (string): See Params
# * server_service_name (string): See Params
# * microkernel_url (string): See Params
#
# (*) It is highly recommended to put secret keys in Hiera-eyaml and use automatic parameter lookup
# [https://github.com/TomPoulton/hiera-eyaml]
# [https://docs.puppetlabs.com/hiera/1/puppet.html#automatic-parameter-lookup]
#
# === Examples
#  class{ 'razor':
#    compile_microkernel   => false,
#    db_hostname           => $::fqdn,
#    db_database           => 'razor',
#    db_user               => 'razor',
#    db_password           => 'notsecret',
#  }
#
# === Authors
#
# Nicolas Truyens <nicolas@truyens.com>
#
class razor (
  # Deployment Options
  $enable_client            = true,
  $enable_db                = true,
  $enable_server            = true,
  $enable_tftp              = true,
  $compile_microkernel      = true,

  # Client
  $client_package_name      = $razor::params::client_package_name,
  $client_package_version   = 'latest',

  # DB
  $database_hostname        = 'localhost',
  $database_name            = 'razor_prod',
  $database_username        = 'razor',
  $database_password        = undef,

  # Server
  $server_package_name      = $razor::params::server_package_name,
  $server_package_version   = 'latest',
  $server_config_file       = $razor::params::server_config_file,
  $server_service_name      = $razor::params::server_service_name,

  # TFTP
  $server_hostname          = $::ipaddress,
  $tftp_root                = undef,

  # Microkernel
  $microkernel_url          = $razor::params::microkernel_url,
  $repo_store               = $razor::params::repo_store,
) inherits razor::params {
  # Validation
  validate_bool($enable_client, $enable_db, $enable_server, $compile_microkernel)

  # Dependencies
  anchor { 'razor-server-dependencies': }
  anchor { 'razor-server-postinstall': }

  # Razor Client
  if $enable_client {
    contain razor::client
  }

  # Razor DB
  if $enable_db {
    contain razor::db

    Class['razor::db'] -> Anchor['razor-server-dependencies']
  }

  # Razor Server
  if $enable_server {
    contain razor::server

    Anchor['razor-server-dependencies'] -> Class['razor::server'] -> Anchor['razor-server-postinstall']
  }

  # Razor Microkernel download/unpack
  if $microkernel_url != undef {
    contain razor::microkernel

    Anchor['razor-server-postinstall'] -> Class['razor::microkernel']
  }

  # Razor TFTP Server
  if $enable_tftp {
    contain razor::tftp

    Anchor['razor-server-postinstall'] -> Class['razor::tftp']
  }

  # Razor Microkernel Compiler
  if $compile_microkernel {
    contain razor::microkernel::compile
  }

  # Shiro Authentication is not (yet) implemented. See notes in lib/puppet/provider/razo_rest.rb if you implement it.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
}
