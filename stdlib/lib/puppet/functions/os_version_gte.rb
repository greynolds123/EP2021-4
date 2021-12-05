<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
# Checks if the OS version is at least a certain version. Note that only the
# major version is taken into account.
#
# Example usage:
#
#     if os_version_gte('Debian', '9') { }
#     if os_version_gte('Ubuntu', '18.04') { }
Puppet::Functions.create_function(:os_version_gte) do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
# @summary
#   Checks if the OS version is at least a certain version.
# > *Note:*
# Only the major version is taken into account.
#
# @example Example usage:#
#     if os_version_gte('Debian', '9') { }
#     if os_version_gte('Ubuntu', '18.04') { }
Puppet::Functions.create_function(:os_version_gte) do
  # @param os operating system
  # @param version
  #
  # @return [Boolean] `true` or `false
<<<<<<< HEAD
=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  dispatch :os_version_gte do
    param 'String[1]', :os
    param 'String[1]', :version
    return_type 'Boolean'
  end

  def os_version_gte(os, version)
    facts = closure_scope['facts']
    (facts['operatingsystem'] == os &&
     Puppet::Util::Package.versioncmp(version, facts['operatingsystemmajrelease']) >= 0)
  end
end
