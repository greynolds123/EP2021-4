# These facter facts return the value of the Puppet vardir and environment path
# settings for the node running puppet or puppet agent.  The intent is to
# enable Puppet modules to automatically have insight into a place where they
# can place variable data, or for modules running on the puppet master to know
# where environments are stored.
#
# The values should be directly usable in a File resource path attribute.
#
begin
  require 'facter/util/puppet_settings'
rescue LoadError => e
  # puppet apply does not add module lib directories to the $LOAD_PATH (See
  # #4248). It should (in the future) but for the time being we need to be
  # defensive which is what this rescue block is doing.
  rb_file = File.join(File.dirname(__FILE__), 'util', 'puppet_settings.rb')
  load rb_file if File.exist?(rb_file) || raise(e)
end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# These will be nil if Puppet is not available.
=======
# Facter fact returns the value of the Puppet vardir
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
# These will be nil if Puppet is not available.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
# These will be nil if Puppet is not available.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
# These will be nil if Puppet is not available.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
Facter.add(:puppet_vardir) do
  setcode do
    Facter::Util::PuppetSettings.with_puppet do
      Puppet[:vardir]
    end
  end
end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# Facter fact returns the value of the Puppet environment path
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
Facter.add(:puppet_environmentpath) do
  setcode do
    Facter::Util::PuppetSettings.with_puppet do
      Puppet[:environmentpath]
    end
  end
end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# Facter fact returns the value of the Puppet server
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
Facter.add(:puppet_server) do
  setcode do
    Facter::Util::PuppetSettings.with_puppet do
      Puppet[:server]
    end
  end
end
