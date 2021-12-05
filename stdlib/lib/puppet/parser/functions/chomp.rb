#
#  chomp.rb
#
module Puppet::Parser::Functions
  newfunction(:chomp, :type => :rvalue, :doc => <<-DOC
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
    Removes the record separator from the end of a string or an array of
    strings, for example `hello\n` becomes `hello`.
    Requires a single string or array as an input.

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
    will be used instead of this function.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      **Deprecated** Removes the record separator from the end of a string or an array of strings.

    For example `hello\n` becomes `hello`.
    Requires a single string or array as an input.

    > *Note:*
      **Deprecated** from Puppet 6.0.0, this function has been replaced with a
    built-in [`chomp`](https://puppet.com/docs/puppet/latest/function.html#chomp) function.

    @return [String] The converted String, if it was a String that was given
    @return [Array[String]] The converted Array, if it was a Array that was given
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
    Removes the record separator from the end of a string or an array of
    strings, for example `hello\n` becomes `hello`.
    Requires a single string or array as an input.
    DOC
             ) do |arguments|

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    raise(Puppet::ParseError, "chomp(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'chomp(): Requires either array or string to work with')
    end

    result = if value.is_a?(Array)
               # Numbers in Puppet are often string-encoded which is troublesome ...
               value.map { |i| i.is_a?(String) ? i.chomp : i }
             else
               value.chomp
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
