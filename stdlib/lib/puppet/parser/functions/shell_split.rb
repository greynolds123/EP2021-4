require 'shellwords'
#
# shell_split.rb
#
module Puppet::Parser::Functions
  newfunction(:shell_split, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Splits a string into an array of tokens in the same way the Bourne shell does.
=======
    @summary
      Splits a string into an array of tokens in the same way the Bourne shell does.

    @return
      array of tokens
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Splits a string into an array of tokens in the same way the Bourne shell does.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Splits a string into an array of tokens in the same way the Bourne shell does.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97

    This function behaves the same as ruby's Shellwords.shellsplit() function
  DOC
             ) do |arguments|

    raise(Puppet::ParseError, "shell_split(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.size != 1

    string = arguments[0].to_s

    result = Shellwords.shellsplit(string)

    return result
  end
end

# vim: set ts=2 sw=2 et :
