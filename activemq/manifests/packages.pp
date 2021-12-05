# Class: activemq::packages
#
#   ActiveMQ Packages
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class activemq::packages (
  $version,
  $package
) {

  validate_re($version, '^[~+._0-9a-zA-Z:-]+$')

  $version_real = $version
  $package_real = $package

  package { $package_real:
<<<<<<< HEAD
    ensure => $version_real,
    notify => Service['activemq'],
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    ensure  => $version_real,
    notify  => Service['activemq'],
  }

  # Has been reworked in 5.9 and no longer needed
  if $::osfamily == 'RedHat' and ($version == 'present' or versioncmp($version, '5.9') < 0) {
    # JJM Fix the activemq init script always exiting with status 0
    # FIXME This should be corrected in the upstream packages
    file { '/etc/init.d/activemq':
      ensure  => file,
      path    => '/etc/init.d/activemq',
      content => template("${module_name}/init/activemq"),
      owner   => '0',
      group   => '0',
      mode    => '0755',
    }
  }
}
