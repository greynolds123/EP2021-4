#
# deprecation.rb
#
module Puppet::Parser::Functions
  newfunction(:deprecation, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  Function to print deprecation warnings (this is the 3.X version of it), The uniqueness key - can appear once. The msg is the message text including any positional information that is formatted by the user/caller of the method.).
=======
  @summary
    Function to print deprecation warnings (this is the 3.X version of it).

  The uniqueness key - can appear once. The msg is the message text including any positional
  information that is formatted by the user/caller of the method.).

  @return [String]
    return deprecation warnings
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
  Function to print deprecation warnings (this is the 3.X version of it), The uniqueness key - can appear once. The msg is the message text including any positional information that is formatted by the user/caller of the method.).
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
  Function to print deprecation warnings (this is the 3.X version of it), The uniqueness key - can appear once. The msg is the message text including any positional information that is formatted by the user/caller of the method.).
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
  Function to print deprecation warnings (this is the 3.X version of it), The uniqueness key - can appear once. The msg is the message text including any positional information that is formatted by the user/caller of the method.).
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
DOC
             ) do |arguments|

    raise(Puppet::ParseError, "deprecation: Wrong number of arguments given (#{arguments.size} for 2)") unless arguments.size == 2

    key = arguments[0]
    message = arguments[1]

    if ENV['STDLIB_LOG_DEPRECATIONS'] == 'true'
      warning("deprecation. #{key}. #{message}")
    end
  end
end
