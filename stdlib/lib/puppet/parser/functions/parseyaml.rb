#
# parseyaml.rb
#
module Puppet::Parser::Functions
  newfunction(:parseyaml, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    This function accepts YAML as a string and converts it into the correct
    Puppet structure.

    The optional second argument can be used to pass a default value that will
    be returned if the parsing of YAML string have failed.
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function accepts YAML as a string and converts it into the correct
      Puppet structure.

    @return
      converted YAML into Puppet structure

    > *Note:*
      The optional second argument can be used to pass a default value that will
      be returned if the parsing of YAML string have failed.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  DOC
             ) do |arguments|
    raise ArgumentError, 'Wrong number of arguments. 1 or 2 arguments should be provided.' unless arguments.length >= 1
    require 'yaml'

    begin
      YAML.load(arguments[0]) || arguments[1] # rubocop:disable Security/YAMLLoad : using YAML.safe_load causes the code to break
      # in ruby 1.9.3 Psych::SyntaxError is a RuntimeException
      # this still needs to catch that and work also on rubies that
      # do not have Psych available.
    rescue StandardError, Psych::SyntaxError => e # rubocop:disable Lint/ShadowedException : See above
      raise e unless arguments[1]
      arguments[1]
    end
  end
end

# vim: set ts=2 sw=2 et :
