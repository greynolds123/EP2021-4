# Class for setting cross-class global overrides. See README.md for more
# details.
class pe_postgresql::globals (
  $ensure               = undef,

  $client_package_name  = undef,
  $server_package_name  = undef,
  $contrib_package_name = undef,
  $devel_package_name   = undef,
  $java_package_name    = undef,
  $perl_package_name    = undef,
  $plperl_package_name  = undef,
  $python_package_name  = undef,
  $postgis_package_name = undef,

  $service_name         = undef,
  $service_provider     = undef,
  $service_status       = undef,
  $default_database     = undef,

  $initdb_path          = undef,
  $createdb_path        = undef,
  $psql_path            = undef,
  $pg_hba_conf_path     = undef,
  $postgresql_conf_path = undef,

  $pg_hba_conf_defaults = undef,

  $datadir              = undef,
  $confdir              = undef,
  $bindir               = undef,
  $xlogdir              = undef,

  $user                 = undef,
  $group                = undef,

  $version              = undef,
  $postgis_version      = undef,

  $needs_initdb         = undef,

  $encoding             = undef,
  $locale               = undef,
  $ctype                = undef,
  $collate              = undef,

  $manage_pg_hba_conf   = undef,

  $manage_package_repo  = undef
) {
  # We are determining this here, because it is needed by the package repo
  # class.
  $default_version = $::osfamily ? {
    /^(RedHat|Linux)/ => $::operatingsystem ? {
      'Fedora' => $::operatingsystemrelease ? {
        /^(18|19|20)$/ => '9.2',
        /^(17)$/ => '9.1',
        default => undef,
      },
      'Amazon' => '9.2',
      default => $::operatingsystemrelease ? {
        /^8\./ => '9.6',
        /^7\./ => '9.2',
        /^6\./ => '8.4',
        /^5\./ => '8.1',
        default => undef,
      },
    },
    'Debian' => $::operatingsystem ? {
      'Debian' => $::operatingsystemrelease ? {
        /^6\./ => '8.4',
        /^(wheezy|7\.)/ => '9.1',
        default => undef,
      },
      'Ubuntu' => $::operatingsystemrelease ? {
        /^(18.04)$/ => '10',
        /^(16.04)$/ => '9.5',
        /^(14.04)$/ => '9.3',
        /^(11.10|12.04|12.10|13.04|13.10)$/ => '9.1',
        /^(10.04|10.10|11.04)$/ => '8.4',
        default => undef,
      },
      default => undef,
    },
    'Archlinux' => $::operatingsystem ? {
      /Archlinux/ => '9.2',
      default => '9.2',
    },
    'FreeBSD' => '93',
    # These are placeholders
    'Suse'    => $::operatingsystem ? {
      'SLES'  => $::operatingsystemrelease ? {
        /^11\./ => '9.1',
        /^12\./ => '9.3',
        default => undef,
      },
      default => undef,
    },
    default   => undef,
  }
  $globals_version = pe_pick($version, $default_version, 'unknown')
  if($globals_version == 'unknown') {
    fail('No preferred version defined or automatically detected.')
  }

  $default_postgis_version = $globals_version ? {
    '8.1'   => '1.3.6',
    '8.4'   => '1.5',
    '9.0'   => '1.5',
    '9.1'   => '1.5',
    '9.2'   => '2.0',
    '9.3'   => '2.1',
    '9.4'   => '2.1',
    '9.5'   => '2.2',
    '9.6'   => '2.3',
    '10'    => '2.4',
    '11'    => '2.5',
    default => undef,
  }
  $globals_postgis_version = pe_pick($postgis_version, $default_postgis_version)

  # Setup of the repo only makes sense globally, so we are doing this here.
  if($manage_package_repo) {
    # Workaround the lack of RHEL7 repositories for now.
    if ! ($::operatingsystem == 'RedHat' and $::operatingsystemrelease =~ /^7/) {
      class { 'pe_postgresql::repo':
        ensure  => $ensure,
        version => $globals_version
      }
    }
  }
}
