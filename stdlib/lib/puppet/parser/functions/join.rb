#
# join.rb
#
<<<<<<< HEAD

module Puppet::Parser::Functions
  newfunction(:join, :type => :rvalue, :doc => <<-EOS
This function joins an array into a string using a separator.

*Examples:*

    join(['a','b','c'], ",")

Would result in: "a,b,c"
    EOS
  ) do |arguments|

    # Technically we support two arguments but only first is mandatory ...
    raise(Puppet::ParseError, "join(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1
=======
module Puppet::Parser::Functions
  newfunction(:join, :type => :rvalue, :doc => <<-DOC
    This function joins an array into a string using a separator.

    *Examples:*

        join(['a','b','c'], ",")

    Would result in: "a,b,c"
    DOC
             ) do |arguments|

    # Technically we support two arguments but only first is mandatory ...
    raise(Puppet::ParseError, "join(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870

    array = arguments[0]

    unless array.is_a?(Array)
      raise(Puppet::ParseError, 'join(): Requires array to work with')
    end

    suffix = arguments[1] if arguments[1]

    if suffix
      unless suffix.is_a?(String)
        raise(Puppet::ParseError, 'join(): Requires string to work with')
      end
    end

    result = suffix ? array.join(suffix) : array.join

    return result
  end
end

# vim: set ts=2 sw=2 et :
