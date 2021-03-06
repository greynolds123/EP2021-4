# Custom Puppet function to convert dos to unix format
module Puppet::Parser::Functions
  newfunction(:dos2unix, :type => :rvalue, :arity => 1, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns the Unix version of the given string.
    Takes a single string argument.
=======
    @summary
      Returns the Unix version of the given string.

    Takes a single string argument.

    @return The retrieved version
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns the Unix version of the given string.
    Takes a single string argument.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns the Unix version of the given string.
    Takes a single string argument.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns the Unix version of the given string.
    Takes a single string argument.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Returns the Unix version of the given string.
    Takes a single string argument.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    unless arguments[0].is_a?(String)
      raise(Puppet::ParseError, 'dos2unix(): Requires string as argument')
    end

    arguments[0].gsub(%r{\r\n}, "\n")
  end
end
