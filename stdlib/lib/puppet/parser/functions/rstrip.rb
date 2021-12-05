#
#  rstrip.rb
#
module Puppet::Parser::Functions
  newfunction(:rstrip, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Strips leading spaces to the right of the string.

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
=======
    @summary
      Strips leading spaces to the right of the string.

    @return
      the string with leading spaces removed

    > *Note:* from Puppet 6.0.0, the compatible function with the same name in Puppet core
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Strips leading spaces to the right of the string.

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Strips leading spaces to the right of the string.

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Strips leading spaces to the right of the string.

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    will be used instead of this function.
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, "rstrip(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'rstrip(): Requires either array or string to work with')
    end

    result = if value.is_a?(Array)
               value.map { |i| i.is_a?(String) ? i.rstrip : i }
             else
               value.rstrip
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
