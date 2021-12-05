<<<<<<< HEAD
class razor::tftp(
  $server
) {
  include ::tftp

  ::tftp::file { "undionly.kpxe": }

  ::tftp::file { "bootstrap.ipxe":
    content => template('razor/bootstrap.ipxe.erb')
=======
# == Class: razor::tftp
#
# Razor Provisioning: Bootfiles for "exporting" by TFTP Server
#
# This is a private class. Only use the 'razor' class.
#
# === Authors
#
# Nicolas Truyens <nicolas@truyens.com>
#
class razor::tftp inherits razor {
  # Validation
  validate_string($::razor::server_hostname)

  #Root directory
  if ($::razor::tftp_root == undef) {
    $directory = $::tftp::directory
  } else {
    validate_absolute_path($::razor::tftp_root)
    $directory = $::razor::tftp_root
  }

  # undionly.kpxe
  wget::fetch { 'http://boot.ipxe.org/undionly.kpxe':
    destination => "${directory}/undionly.kpxe",
  } ->

  tftp::file { 'undionly.kpxe':
    ensure => file,
    source => "${directory}/undionly.kpxe",
  }

  # bootstrap.ipxe
  wget::fetch { "http://${::razor::server_hostname}:8080/api/microkernel/bootstrap":
    destination => "${directory}/bootstrap.ipxe",
  } ->

  tftp::file { 'bootstrap.ipxe':
    ensure => file,
    source => "${directory}/bootstrap.ipxe",
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  }
}
