#
# type3x.rb
#
module Puppet::Parser::Functions
  newfunction(:type3x, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    DEPRECATED: This function will be removed when Puppet 3 support is dropped; please migrate to the new parser's typing system.

    Returns the type when passed a value. Type can be one of:
=======
    @summary
      **DEPRECATED:** This function will be removed when Puppet 3 support is dropped; please migrate to the new parser's typing system.

    @return the type when passed a value. Type can be one of:
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    DEPRECATED: This function will be removed when Puppet 3 support is dropped; please migrate to the new parser's typing system.

    Returns the type when passed a value. Type can be one of:
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    DEPRECATED: This function will be removed when Puppet 3 support is dropped; please migrate to the new parser's typing system.

    Returns the type when passed a value. Type can be one of:
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97

    * string
    * array
    * hash
    * float
    * integer
    * boolean
  DOC
             ) do |args|
    raise(Puppet::ParseError, "type3x(): Wrong number of arguments given (#{args.size} for 1)") unless args.size == 1

    value = args[0]

    klass = value.class

    unless [TrueClass, FalseClass, Array, Bignum, Fixnum, Float, Hash, String].include?(klass) # rubocop:disable Lint/UnifiedInteger
      raise(Puppet::ParseError, 'type3x(): Unknown type')
    end

    klass = klass.to_s # Ugly ...

    # We note that Integer is the parent to Bignum and Fixnum ...
    result = case klass
             when %r{^(?:Big|Fix)num$} then 'integer'
             when %r{^(?:True|False)Class$} then 'boolean'
             else klass
             end

    if result == 'String'
      if value == value.to_i.to_s
        result = 'Integer'
      elsif value == value.to_f.to_s
        result = 'Float'
      end
    end

    return result.downcase
  end
end

# vim: set ts=2 sw=2 et :
