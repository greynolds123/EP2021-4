#
#  chop.rb
#
module Puppet::Parser::Functions
  newfunction(:chop, :type => :rvalue, :doc => <<-DOC
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
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    Returns a new string with the last character removed. If the string ends
    with `\r\n`, both characters are removed. Applying chop to an empty
    string returns an empty string. If you wish to merely remove record
    separators then you should use the `chomp` function.
    Requires a string or array of strings as input.
<<<<<<< HEAD

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
    will be used instead of this function.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      **Deprecated** Returns a new string with the last character removed.

    If the string ends with `\r\n`, both characters are removed. Applying
    chop to an empty string returns an empty string. If you wish to merely
    remove record separators then you should use the `chomp` function.
    Requires a string or array of strings as input.

    > *Note:* **Deprecated** from Puppet 6.0.0, this function has been replaced with a
    built-in [`chop`](https://puppet.com/docs/puppet/latest/function.html#chop) function.

    @return [String] The given String, sans the last character.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

=======
    DOC
             ) do |arguments|

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    raise(Puppet::ParseError, "chop(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'chop(): Requires either an array or string to work with')
    end

    result = if value.is_a?(Array)
               # Numbers in Puppet are often string-encoded which is troublesome ...
               value.map { |i| i.is_a?(String) ? i.chop : i }
             else
               value.chop
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
