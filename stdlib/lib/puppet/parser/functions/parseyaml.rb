#
# parseyaml.rb
#
<<<<<<< HEAD

module Puppet::Parser::Functions
  newfunction(:parseyaml, :type => :rvalue, :doc => <<-EOS
This function accepts YAML as a string and converts it into the correct
Puppet structure.

The optional second argument can be used to pass a default value that will
be returned if the parsing of YAML string have failed.
  EOS
  ) do |arguments|
=======
module Puppet::Parser::Functions
  newfunction(:parseyaml, :type => :rvalue, :doc => <<-DOC
    This function accepts YAML as a string and converts it into the correct
    Puppet structure.

    The optional second argument can be used to pass a default value that will
    be returned if the parsing of YAML string have failed.
  DOC
             ) do |arguments|
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
    raise ArgumentError, 'Wrong number of arguments. 1 or 2 arguments should be provided.' unless arguments.length >= 1
    require 'yaml'

    begin
<<<<<<< HEAD
      YAML::load(arguments[0]) || arguments[1]
      # in ruby 1.9.3 Psych::SyntaxError is a RuntimeException
      # this still needs to catch that and work also on rubies that
      # do not have Psych available.
    rescue StandardError, Psych::SyntaxError => e
      if arguments[1]
        arguments[1]
      else
        raise e
      end
    end

=======
      YAML.load(arguments[0]) || arguments[1] # rubocop:disable Security/YAMLLoad : using YAML.safe_load causes the code to break
      # in ruby 1.9.3 Psych::SyntaxError is a RuntimeException
      # this still needs to catch that and work also on rubies that
      # do not have Psych available.
    rescue StandardError, Psych::SyntaxError => e # rubocop:disable Lint/ShadowedException : See above
      raise e unless arguments[1]
      arguments[1]
    end
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
  end
end

# vim: set ts=2 sw=2 et :
