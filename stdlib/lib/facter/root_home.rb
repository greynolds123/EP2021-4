<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
# A facter fact to determine the root home directory.
# This varies on PE supported platforms and may be
# reconfigured by the end user.
module Facter::Util::RootHome
  class << self
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# root_home.rb
module Facter::Util::RootHome
  # @summary
  #   A facter fact to determine the root home directory.
  #   This varies on PE supported platforms and may be
  #   reconfigured by the end user.
  class << self
  # determines the root home directory
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  def returnt_root_home
    root_ent = Facter::Util::Resolution.exec('getent passwd root')
    # The home directory is the sixth element in the passwd entry
    # If the platform doesn't have getent, root_ent will be nil and we should
    # return it straight away.
    root_ent && root_ent.split(':')[5]
  end
  end
end

Facter.add(:root_home) do
  setcode { Facter::Util::RootHome.returnt_root_home }
end

Facter.add(:root_home) do
  confine :kernel => :darwin
  setcode do
    str = Facter::Util::Resolution.exec('dscacheutil -q user -a name root')
    hash = {}
    str.split("\n").each do |pair|
      key, value = pair.split(%r{:})
      hash[key] = value
    end
    hash['dir'].strip
  end
end

Facter.add(:root_home) do
  confine :kernel => :aix
  root_home = nil
  setcode do
    str = Facter::Util::Resolution.exec('lsuser -c -a home root')
    str && str.split("\n").each do |line|
      next if line =~ %r{^#}
      root_home = line.split(%r{:})[1]
    end
    root_home
  end
end
