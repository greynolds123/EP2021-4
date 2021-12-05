<<<<<<< HEAD
class razor::server {
  $url  = 'http://links.puppetlabs.com/razor-server-latest.zip'
  $dest = '/opt/razor'

  # Put the archive into place, if needed.
  exec { "install razor binary distribution to ${dest}":
    provider => shell,
    command  => template('razor/install-zip.sh.erb'),
    path     => '/bin:/usr/bin:/usr/local/bin:/opt/bin',
    creates  => "${dest}/bin/razor-admin",
    require  => [Package[curl], Package[unzip]],
    notify   => Exec["deploy razor to torquebox"]
  }

  exec { "deploy razor if it was undeployed":
    provider => shell,
    unless   => "test -f ${razor::torquebox::dest}/jboss/standalone/deployments/razor-knob.yml",
    # This is actually "notify if the file does not exist" :)
    command  => ":",
    notify   => Exec["deploy razor to torquebox"],
    require  => Exec["install razor binary distribution to ${dest}"]
  }

  # deploy razor, if required.
  exec { "deploy razor to torquebox":
    command     => "${razor::torquebox::dest}/jruby/bin/torquebox deploy --env production",
    cwd         => $dest,
    environment => [
      "TORQUEBOX_HOME=${razor::torquebox::dest}",
      "JBOSS_HOME=${razor::torquebox::dest}/jboss",
      "JRUBY_HOME=${razor::torquebox::dest}/jruby"
    ],
    path        => "${razor::torquebox::dest}/jruby/bin:/bin:/usr/bin:/usr/local/bin",
    require     => Exec["install razor binary distribution to ${dest}"],
    refreshonly => true
  }

  file { "${dest}/bin/razor-binary-wrapper":
    ensure  => file, owner => root, group => root, mode => 0755,
    content => template('razor/razor-binary-wrapper.erb'),
    require => Exec["install razor binary distribution to ${dest}"]
  }

  file { "/usr/local/bin/razor-admin":
    ensure => link, target => "${dest}/bin/razor-binary-wrapper"
  }

  # Work around what seems very much like a bug in the package...
  file { "${dest}/bin/razor-admin":
    mode    => 0755,
    require => Exec["install razor binary distribution to ${dest}"]
  }

  file { "/var/lib/razor":
    ensure => directory, owner => razor-server, group => razor-server, mode => 0775,
    require => Exec["install razor binary distribution to ${dest}"]
  }

  file { "/var/lib/razor/repo-store":
    ensure => directory, owner => razor-server, group => razor-server, mode => 0775
  }

  file { "${dest}/log":
    ensure  => directory, owner => razor-server, group => razor-server, mode => 0775,
    require => Exec["install razor binary distribution to ${dest}"]
  }

  file { "${dest}/log/production.log":
    ensure  => file, owner => razor-server, group => razor-server, mode => 0660
=======
# == Class: razor::server
#
# Razor Provisioning: Server Setup
#
# This is a private class. Only use the 'razor' class.
#
# === Authors
#
# Nicolas Truyens <nicolas@truyens.com>
#
class razor::server inherits razor {
  # Validation
  if $::razor::database_password == undef {
    fail('database_password is a required parameter!')
  }
  validate_string($::razor::database_hostname, $::razor::database_name)
  validate_string($::razor::database_username, $::razor::database_password)
  validate_string($::razor::server_package_name, $::razor::server_package_version)
  validate_absolute_path($::razor::server_config_file)
  validate_absolute_path($::razor::repo_store)

  # Compatibility
  case $::osfamily {
    'debian': {
      case $::operatingsystem {
        'Ubuntu': {
          case $::lsbdistcodename {
            'lucid','maverick','natty','oneiric': {
              # Lucid - OK
            }
            'precise','quantal','raring','saucy': {
              # Precise - OK
            }
            'trusty','utopic','vivid': {
              # Trusty - NOT !!!
              fail("Ubuntu Trusty (>= 14.04) is not supported yet! ${::lsbdistcodename}")
            }
            default: {
              fail("Ubuntu < 10.04 and >= 14.04 is not supported: ${::lsbdistcodename}")
            }
          }
        }
        'Debian': {
          case $::lsbdistcodename {
            'squeeze','wheezy': {
              # Squeeze (6) - OK
              # Wheezy (7) - OK
            }
            default: {
              fail("Debian < 6 and > 8 is not supported: ${::lsbdistcodename}")
            }
          }
        }
        default: {
          fail("Operating System (debian) is not supported: ${::operatingsystem}")
        }
      }
    }
    'redhat': {
      case $::operatingsystem {
        'CentOS': {
          case $::operatingsystemmajrelease {
            '5': {
              # EL 5(x) - OK
              # EL 5.0 - 5.9 - OK
            }
            '6': {
              # EL 6(x) - OK
              # EL 6.0 - 6.5 - OK
            }
            '7': {
              fail("CentOS/RHEL 7 is not supported yet ${::operatingsystem}")
            }
            default: {
              fail("CentOS/RHEL < 5 and >= 7 is not supported: ${::operatingsystemmajrelease}")
            }
          }
        }
        'Fedora': {
          case $::operatingsystemmajrelease {
            '19': {
              fail('Fedora 19 is not supported')
            }
            '20': {
              # Fedora 20 - OK
            }
            default: {
              fail("Fedora < 20 and > 20 is not supported: ${::operatingsystemmajrelease}")
            }
          }
        }
        default: {
          fail("Operating System (Redhat) is not supported: ${::operatingsystem}")
        }
      }
    }
    default: {
      fail("Operating System Family is not supported: ${::osfamily}")
    }
  }

  # Installation
  package { $::razor::server_package_name:
    ensure => $::razor::server_package_version,
  }

  # Configuration File
  $db_url_production = "jdbc:postgresql://${::razor::database_hostname}/${::razor::database_name}?user=${::razor::database_username}&password=${::razor::database_password}"
  $repo_store = $::razor::repo_store

  Package[$::razor::server_package_name]
  ->
  file { $::razor::server_config_file:
    ensure  => 'file',
    content => template('razor/config.yaml.erb'),
  }

  # Manage the service
  File[$::razor::server_config_file]
  ->
  service { $::razor::server_service_name:
    ensure => 'running',
  }

  # Setup the Database
  # File[$::razor::server_config_file] -> => not required?
  exec { 'razor-migrate-database':
    cwd         => '/opt/razor',
    path        => ['/bin', '/sbin', '/usr/bin', '/usr/sbin', '/usr/local/bin', '/usr/local/sbin', '/opt/razor/bin', '/opt/razor-torquebox/jruby/bin'],
    command     => 'razor-admin -e production migrate-database',
    subscribe   => File[$::razor::server_config_file],
    refreshonly => true,
    notify      => Service[$::razor::server_service_name],
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  }
}
