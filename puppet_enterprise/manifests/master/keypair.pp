# Generic define for copying puppet keypairs from the compiling master to an additional
# master.
#
# You can either pass in one keypair, or an array.
#
# @param keypair_name [String] The name of the keypair to copy.
#
# @example To copy multiple keypairs at once, you can pass in an array:
#
# $keypairs = ['test1', 'test2', 'test3']
# puppet_enterprise::master::keypair { $keypairs: }
#
<<<<<<< HEAD
# This will copy the cert and private keys for test1, test2 and test3
=======
# This will copy the cert and public/private keys for test1, test2 and test3
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
# from one compiling master to the new master.
#
define puppet_enterprise::master::keypair(
  $keypair_name = $title,
<<<<<<< HEAD
  Enum['present', 'absent'] $ensure = 'present',
){

  File {
    ensure  => $ensure,
    owner   => $puppet_enterprise::params::puppet_user,
    group   => $puppet_enterprise::params::puppet_group,
    mode    => '0640',
    require => $ensure ? {
      present => Package['pe-puppetserver'],
      absent => undef
    },
=======
){
  File {
    owner   => $puppet_enterprise::params::puppet_user,
    group   => $puppet_enterprise::params::puppet_group,
    mode    => '0640',
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  $cert_dir = "${puppet_enterprise::params::ssl_dir}/certs"
  $private_key_dir = "${puppet_enterprise::params::ssl_dir}/private_keys"
<<<<<<< HEAD
=======
  $public_key_dir = "${puppet_enterprise::params::ssl_dir}/public_keys"
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547

  file { "${keypair_name}.cert.pem":
    path    => "${cert_dir}/${keypair_name}.pem",
    content => file("${cert_dir}/${keypair_name}.pem", '/dev/null'),
  }

  file { "${keypair_name}.private_key.pem":
    path    => "${private_key_dir}/${keypair_name}.pem",
<<<<<<< HEAD
    content => Sensitive(file("${private_key_dir}/${keypair_name}.pem", '/dev/null')),
  }

  if $ensure == 'absent' {
    file { "${keypair_name}.public_key.pem":
      ensure =>  $ensure,
      path    => "${puppet_enterprise::params::ssl_dir}/public_keys/${keypair_name}.pem",
    }

    file { "${keypair_name}.signed.pem":
      ensure =>  $ensure,
      path   => "${puppet_enterprise::params::ssl_dir}/ca/signed/${keypair_name}.pem",
    }
=======
    content => file("${private_key_dir}/${keypair_name}.pem", '/dev/null'),
  }

  file { "${keypair_name}.public_key.pem":
    path    => "${public_key_dir}/${keypair_name}.pem",
    content => file("${public_key_dir}/${keypair_name}.pem", '/dev/null'),
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }
}
