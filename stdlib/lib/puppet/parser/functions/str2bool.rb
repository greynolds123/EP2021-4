#
# str2bool.rb
#
module Puppet::Parser::Functions
  newfunction(:str2bool, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    This converts a string to a boolean. This attempt to convert strings that
    contain things like: Y,y, 1, T,t, TRUE,true to 'true' and strings that contain things
    like: 0, F,f, N,n, false, FALSE, no to 'false'.

    Note that since Puppet 5.0.0 the Boolean data type can convert strings to a Boolean value.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This converts a string to a boolean.

    @return
      This attempt to convert to boolean strings that contain things like: Y,y, 1, T,t, TRUE,true to 'true' and strings that contain things
      like: 0, F,f, N,n, false, FALSE, no to 'false'.

    > *Note:* that since Puppet 5.0.0 the Boolean data type can convert strings to a Boolean value.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    See the function new() in Puppet for details what the Boolean data type supports.
  DOC
             ) do |arguments|

=======
    This converts a string to a boolean. This attempt to convert strings that
    contain things like: Y,y, 1, T,t, TRUE,true to 'true' and strings that contain things
    like: 0, F,f, N,n, false, FALSE, no to 'false'.
  DOC
             ) do |arguments|

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    raise(Puppet::ParseError, "str2bool(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    string = arguments[0]

    # If string is already Boolean, return it
    if !!string == string # rubocop:disable Style/DoubleNegation : No viable alternative
      return string
    end

    unless string.is_a?(String)
      raise(Puppet::ParseError, 'str2bool(): Requires string to work with')
    end

    # We consider all the yes, no, y, n and so on too ...
    result = case string
             #
             # This is how undef looks like in Puppet ...
             # We yield false in this case.
             #
             when %r{^$}, '' then false # Empty string will be false ...
             when %r{^(1|t|y|true|yes)$}i  then true
             when %r{^(0|f|n|false|no)$}i  then false
             when %r{^(undef|undefined)$} then false # This is not likely to happen ...
             else
               raise(Puppet::ParseError, 'str2bool(): Unknown type of boolean given')
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
