# Custom Puppet function to convert unix to dos format
module Puppet::Parser::Functions
  newfunction(:unix2dos, :type => :rvalue, :arity => 1, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
    Returns the DOS version of the given string.
=======
    @summary
      Returns the DOS version of the given string.

    @return
      the DOS version of the given string.

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns the DOS version of the given string.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    Takes a single string argument.
    DOC
             ) do |arguments|

    unless arguments[0].is_a?(String)
      raise(Puppet::ParseError, 'unix2dos(): Requires string as argument')
    end

    arguments[0].gsub(%r{\r*\n}, "\r\n")
  end
end
