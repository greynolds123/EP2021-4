# A helper for converting pem-formatted certificates (like we use in most
# places) to pk8 format, which is required by the posgrestsql jdbc driver for
# client cert authentication.
#
# @param pem_file [String] The path to the source pem file to be converted
# @param owner [String] The owner of the output pk8 file
# @param group [String] The group of the output pk8 file
# @param mode [String] The mode of the output pk8 file
<<<<<<< HEAD
# @param container [String] The name of the PE service without the pe- in front
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
# @param pk8_file [String] ($title) The path to the output pk8 file.
define puppet_enterprise::certs::pk8_cert(
  String $pem_file,
  String $owner,
  String $group,
  String $mode,
<<<<<<< HEAD
  String $container,
  String $pk8_file = $title
) {

  $pe_container = "pe-${container}"

=======
  String $pk8_file = $title
) {
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  exec { $pk8_file:
    path    => [ '/opt/puppetlabs/puppet/bin', $::facts['path'] ],
    command => "openssl pkcs8 -topk8 -inform PEM -outform DER -in ${pem_file} -out ${pk8_file} -nocrypt",
    # Generate a .pk8 key if one doesn't exist or is older than the .pem input.
    # NOTE: bash file time checks, like -ot, can't always discern sub-second
    # differences.
<<<<<<< HEAD
    onlyif => "test ! -e '${pk8_file}' -o '${pk8_file}' -ot '${pem_file}'",
    notify  => Service[$pe_container],
=======
    onlyif => "test ! -e '${pk8_file}' -o '${pk8_file}' -ot '${pem_file}'"
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }

  file { $pk8_file:
    ensure => present,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
<<<<<<< HEAD
    before => Exec["${pe_container} service full restart"],
=======
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  }
}
