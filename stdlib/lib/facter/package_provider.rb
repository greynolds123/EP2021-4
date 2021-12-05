# Fact: package_provider
#
# Purpose: Returns the default provider Puppet will choose to manage packages
#   on this system
#
# Resolution: Instantiates a dummy package resource and return the provider
#
# Caveats:
#
require 'puppet/type'
require 'puppet/type/package'

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
Facter.add(:package_provider) do
=======
# These will be nil if Puppet is not available.
Facter.add(:package_provider) do
  # Instantiates a dummy package resource and return the provider
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
Facter.add(:package_provider) do
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
Facter.add(:package_provider) do
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  setcode do
    if defined? Gem && Gem::Version.new(Facter.value(:puppetversion).split(' ')[0]) >= Gem::Version.new('3.6')
      Puppet::Type.type(:package).newpackage(:name => 'dummy', :allow_virtual => 'true')[:provider].to_s
    else
      Puppet::Type.type(:package).newpackage(:name => 'dummy')[:provider].to_s
    end
  end
end
