#
# is_email_address.rb
#
module Puppet::Parser::Functions
  newfunction(:is_email_address, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the string passed to this function is a valid email address.
=======
    @summary
      **Deprecated:** Returns true if the string passed to this function is a valid email address.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the string passed to this function is a valid email address.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the string passed to this function is a valid email address.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns true if the string passed to this function is a valid email address.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Returns true if the string passed to this function is a valid email address.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|
    if arguments.size != 1
      raise(Puppet::ParseError, "is_email_address(): Wrong number of arguments given #{arguments.size} for 1")
    end

    # Taken from http://emailregex.com/ (simpler regex)
    valid_email_regex = %r{\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z}
    return (arguments[0] =~ valid_email_regex) == 0 # rubocop:disable Style/NumericPredicate : Changing to '.zero?' breaks the code
  end
end

# vim: set ts=2 sw=2 et :
