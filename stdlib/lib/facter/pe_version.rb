# Fact: is_pe, pe_version, pe_major_version, pe_minor_version, pe_patch_version
#
# Purpose: Return various facts about the PE state of the system
#
# Resolution: Uses a regex match against puppetversion to determine whether the
#   machine has Puppet Enterprise installed, and what version (overall, major,
#   minor, patch) is installed.
#
# Caveats:
#
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# Fact: pe_version
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
Facter.add('pe_version') do
  setcode do
    puppet_ver = Facter.value('puppetversion')
    if !puppet_ver.nil?
      pe_ver = puppet_ver.match(%r{Puppet Enterprise (\d+\.\d+\.\d+)})
      pe_ver[1] if pe_ver
    else
      nil
    end
  end
end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# Fact: is_pe
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
Facter.add('is_pe') do
  setcode do
    if Facter.value(:pe_version).to_s.empty?
      false
    else
      true
    end
  end
end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# Fact: pe_major_version
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
Facter.add('pe_major_version') do
  confine :is_pe => true
  setcode do
    pe_version = Facter.value(:pe_version)
    if pe_version
      pe_version.to_s.split('.')[0]
    end
  end
end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# Fact: pe_minor_version
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
Facter.add('pe_minor_version') do
  confine :is_pe => true
  setcode do
    pe_version = Facter.value(:pe_version)
    if pe_version
      pe_version.to_s.split('.')[1]
    end
  end
end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# Fact: pe_patch_version
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
Facter.add('pe_patch_version') do
  confine :is_pe => true
  setcode do
    pe_version = Facter.value(:pe_version)
    if pe_version
      pe_version.to_s.split('.')[2]
    end
  end
end
