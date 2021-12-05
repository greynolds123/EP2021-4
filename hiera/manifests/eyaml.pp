# == Class: hiera::eyaml
#
# This class installs and configures hiera-eyaml
#
# === Authors:
#
# Terri Haber <terri@puppetlabs.com>
#
# === Copyright:
#
# Copyright (C) 2014 Terri Haber, unless otherwise noted.
#
class hiera::eyaml {
<<<<<<< HEAD
  $eyaml_name    = $hiera::eyaml_name
  $provider      = $hiera::provider
  $eyaml_version = $hiera::eyaml_version
  $eyaml_source  = $hiera::_eyaml_source

<<<<<<< HEAD
  $owner         = $hiera::eyaml_owner
  $group         = $hiera::eyaml_group
  $cmdpath       = $hiera::cmdpath
  $confdir       = $hiera::confdir
  $create_keys   = $hiera::create_keys
  $_keysdir      = $hiera::_keysdir

  $manage_package = $hiera::manage_eyaml_package
=======
  $owner         = $::hiera::eyaml_owner
  $group         = $::hiera::eyaml_group
=======
  $eyaml_name    = $::hiera::eyaml_name
  $provider      = $::hiera::provider
  $eyaml_version = $::hiera::eyaml_version
  $eyaml_source  = $::hiera::_eyaml_source

  $owner         = $::hiera::owner
  $group         = $::hiera::group
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  $cmdpath       = $::hiera::cmdpath
  $confdir       = $::hiera::confdir
  $create_keys   = $::hiera::create_keys
  $_keysdir      = $::hiera::_keysdir

<<<<<<< HEAD
  $manage_package = $::hiera::manage_eyaml_package
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
  $manage_package = $::hiera::manage_package
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

  if $manage_package {
    ::hiera::install { 'eyaml':
      gem_name    => $eyaml_name,
      provider    => $provider,
      gem_version => $eyaml_version,
      gem_source  => $eyaml_source,
    }
    if $create_keys {
      Hiera::Install['eyaml'] {
        before => Exec['createkeys'],
      }
    }
  }

  File {
    owner => $owner,
    group => $group,
  }

  file { $_keysdir:
    ensure => directory,
  }

  $keysdir = dirname($_keysdir)

  if ( $create_keys == true ) {

    exec { 'createkeys':
      user    => $owner,
      cwd     => $keysdir,
      command => 'eyaml createkeys',
      path    => $cmdpath,
      creates => "${_keysdir}/private_key.pkcs7.pem",
      require => File[$_keysdir],
    }

    file { "${_keysdir}/private_key.pkcs7.pem":
      ensure  => file,
      mode    => '0600',
      require => Exec['createkeys'],
    }

    file { "${_keysdir}/public_key.pkcs7.pem":
      ensure  => file,
      mode    => '0644',
      require => Exec['createkeys'],
    }
  }
}
