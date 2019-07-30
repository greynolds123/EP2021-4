# == Class: puppet_enterprise::packages
#
# This class contains virtual resources for all packages managed by PE.
# This is necessary as a single node may contain multiple profiles
# where each profile could want to install the same package, e.g.
# pe-java, causing a compilation error.
#
<<<<<<< HEAD
# @param installing [String] Defaults to false. Set true by the installer to bypass
#   modifying the local repository configuration.
#
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
# === Examples
#
# include puppet_enterprise::packages
#
# Package <| tag == 'master' |>
#
<<<<<<< HEAD
class puppet_enterprise::packages(
  Boolean $installing = false,
){
  include puppet_enterprise::params

  # When installing PE (first time or upgrading), we should rely on the local
  # packages repo instead of the master's package repo link that is setup by
  # puppet_enterprise::repo. Once the MEEP run is complete, a regular
  # puppet run should complete the setup of the repo configuration pointing
  # to the primary (either local or networked). This parameter is set
  # by MEEP when building the catalog during `puppet-infra configure`.
  class { 'puppet_enterprise::repo' :
    installing => $installing,
  }

  Package {
    ensure => latest,
    require => Class['puppet_enterprise::repo'],
    *      => $puppet_enterprise::params::package_options,
  }

  package { 'pe-bundler':
    ensure => absent,
  }

  if $puppet_enterprise::params::postgres_multi_version_packaging {
    @package { 'pe-postgresql-common':
      tag =>  [
        'pe-psql-common',
      ],
    }
  }

  @package { $puppet_enterprise::params::postgresql_pglogical_package_name:
=======
class puppet_enterprise::packages{
  include puppet_enterprise::params

  Package {
    ensure => latest,
    *      => $puppet_enterprise::params::package_options,
  }

  @package { 'pe-postgresql-pglogical':
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
    tag => [
      'pe-psql-pglogical',
    ],
  }

<<<<<<< HEAD
  @package { $puppet_enterprise::params::postgresql_pgrepack_package_name:
    tag => [
      'pe-database-extensions',
    ],
  }

=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  @package { 'pe-java':
    tag => [
      'pe-master-packages',
      'pe-puppetdb-packages',
<<<<<<< HEAD
      'pe-console-packages',
      'pe-razor-packages',
=======
      'pe-activemq-packages',
      'pe-console-packages'
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
    ],
  }

  @package { 'pe-puppetdb':
    tag => 'pe-puppetdb-packages',
  }

  @package { 'pe-console-services':
    tag => 'pe-console-packages',
  }

  @package { 'pe-client-tools':
    tag => 'pe-controller-packages',
  }

  @package { [
    'pe-license',
<<<<<<< HEAD
    'pe-puppetdb-termini',
    'pe-console-services-termini',
    'pe-puppetserver',
    'pe-modules',
    'pe-tasks',
    'pe-backup-tools',
=======
    'pe-puppet-license-cli',
    'pe-puppetdb-termini',
    'pe-console-services-termini',
    'pe-puppetserver',
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  ]:
    tag => 'pe-master-packages',
  }

<<<<<<< HEAD
  @package { 'pe-installer':
    tag => 'pe-installer-packages'
  }

=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  @package { 'pe-orchestration-services':
    tag => 'pe-orchestrator-packages',
  }

<<<<<<< HEAD
  @package { 'pe-bolt-server':
    tag => 'pe-bolt-server-packages',
  }

  @package { 'pe-ace-server':
    tag => 'pe-ace-server-packages',
=======
  @package { 'pe-activemq':
    tag => 'pe-activemq-packages',
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  @package { 'pe-puppet-enterprise-release':
    tag => [
<<<<<<< HEAD
      'pe-console-packages',
      'pe-master-packages',
      'pe-puppetdb-packages',
      'pe-database-packages',
    ],
  }

  @package { [
    'pe-razor-libs',
    'pe-razor-server',
  ]:
    tag => 'pe-razor-packages'
  }
=======
      'pe-activemq-packages',
      'pe-console-packages',
      'pe-master-packages',
      'pe-puppetdb-packages',
    ],
  }
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
}
