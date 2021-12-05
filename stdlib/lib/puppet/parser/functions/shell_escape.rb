require 'shellwords'
#
# shell_escape.rb
#
module Puppet::Parser::Functions
  newfunction(:shell_escape, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Escapes a string so that it can be safely used in a Bourne shell command line.

    Note that the resulting string should be used unquoted and is not intended for use in double quotes nor in single
=======
    @summary
      Escapes a string so that it can be safely used in a Bourne shell command line.

    @return
      A string of characters with metacharacters converted to their escaped form.

    >* Note:* that the resulting string should be used unquoted and is not intended for use in double quotes nor in single
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Escapes a string so that it can be safely used in a Bourne shell command line.

    Note that the resulting string should be used unquoted and is not intended for use in double quotes nor in single
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Escapes a string so that it can be safely used in a Bourne shell command line.

    Note that the resulting string should be used unquoted and is not intended for use in double quotes nor in single
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Escapes a string so that it can be safely used in a Bourne shell command line.

    Note that the resulting string should be used unquoted and is not intended for use in double quotes nor in single
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Escapes a string so that it can be safely used in a Bourne shell command line.

    Note that the resulting string should be used unquoted and is not intended for use in double quotes nor in single
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    quotes.

    This function behaves the same as ruby's Shellwords.shellescape() function.
  DOC
             ) do |arguments|

    raise(Puppet::ParseError, "shell_escape(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.size != 1

    # explicit conversion to string is required for ruby 1.9
    string = arguments[0].to_s

    result = Shellwords.shellescape(string)

    return result
  end
end

# vim: set ts=2 sw=2 et :
