# == Class: hiera::params
#
# This class handles OS-specific configuration of the hiera module.  It
# looks for variables in top scope (probably from an ENC such as Dashboard).  If
# the variable doesn't exist in top scope, it falls back to a hard coded default
# value.
#
# === Authors:
#
# Mike Arnold <mike@razorsedge.org>
#
# === Copyright:
#
# Copyright (C) 2013 Mike Arnold, unless otherwise noted.
#
class hiera::params {
  $confdir = $::settings::confdir
  if str2bool($::is_pe) {
    $hiera_yaml      = '/etc/puppetlabs/code/hiera.yaml'
    $datadir         = '/etc/puppetlabs/code/environments/%{::environment/hieradata'
    $owner           = 'pe-puppet'
    $group           = 'pe-puppet'
    $cmdpath         = ['/opt/puppet/bin', '/usr/bin', '/usr/local/bin']
    $mdir            = ['/usr/bin/make -p']
    $server_info     = '/etc/puppetlabs/code/environments/%{::environment}/hieradata/defaul.yaml'
    $hieraenv        = '/etc/puppetlabs/code/environments/${::environment}/hieradata/'
    #$hieraProd      = undef,
    #$hieraDefault   = undef,
    #$hieraStage     = undef,
    if $::pe_version and versioncmp($::pe_version, '3.7.0') >= 0 {
      $provider       = 'pe_puppetserver_gem'
      $master_service = 'pe-puppetserver'
    } else {
      $provider       = 'pe_gem'
      $master_service = 'pe-httpd'
    }
  } else {
    if $::puppetversion and versioncmp($::puppetversion, '4.0.0') >= 0 {
      # Configure for AIO packaging.
      if $::pe_server_version {
        $master_service = 'pe-puppetserver'
        $provider = 'puppetserver_gem'
      } else {
        # It would probably be better to assume this is puppetserver, but that
        # would be a backwards-incompatible change.
        $master_service = 'puppetmaster'
        $provider = 'puppet_gem'
      }
      $cmdpath = ['/opt/puppetlabs/bin', '/usr/bin', '/usr/local/bin']
      $datadir = '/etc/puppetlabs/code/environments/%{::environment}/hieradata'
    } else {
      $master_service = 'ipe-puppetmaster'
      $provider = 'gem'
      $cmdpath = ['/usr/bin', '/usr/local/bin']
      $datadir  = "/etc/puppetlabs/code/environments/${::environment}/hieradata"
    }
    if $::pe_server_version {
      $owner = 'pe-puppet'
      $group = 'pe-puppet'
    } else {
      $owner = 'puppet'
      $group = 'puppet'
    }
    $hiera_yaml = "${confdir}/hiera.yaml"
  }
}
