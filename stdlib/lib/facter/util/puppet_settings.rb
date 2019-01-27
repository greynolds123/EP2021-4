<<<<<<< HEAD
module Facter
  module Util
    module PuppetSettings
      # This method is intended to provide a convenient way to evaluate a
      # Facter code block only if Puppet is loaded.  This is to account for the
      # situation where the fact happens to be in the load path, but Puppet is
      # not loaded for whatever reason.  Perhaps the user is simply running
      # facter without the --puppet flag and they happen to be working in a lib
      # directory of a module.
      def self.with_puppet
        begin
          Module.const_get("Puppet")
        rescue NameError
          nil
        else
          yield
        end
      end
    end
=======
# A method to evaluate a Facter code block if puppet is loaded.
module Facter::Util::PuppetSettings
  # This method is intended to provide a convenient way to evaluate a
  # Facter code block only if Puppet is loaded.  This is to account for the
  # situation where the fact happens to be in the load path, but Puppet is
  # not loaded for whatever reason.  Perhaps the user is simply running
  # facter without the --puppet flag and they happen to be working in a lib
  # directory of a module.
  def self.with_puppet
    Module.const_get('Puppet')
  rescue NameError
    nil
  else
    yield
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
  end
end
