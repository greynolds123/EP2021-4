<<<<<<< HEAD
module Puppet::Parser::Functions

  newfunction(:validate_bool, :doc => <<-'ENDHEREDOC') do |args|
=======
#
# validate_bool.rb
#
module Puppet::Parser::Functions
  newfunction(:validate_bool, :doc => <<-'DOC') do |args|
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    Validate that all passed values are either true or false. Abort catalog
    compilation if any value fails this check.

    The following values will pass:

        $iamtrue = true
        validate_bool(true)
        validate_bool(true, true, false, $iamtrue)

    The following values will fail, causing compilation to abort:

        $some_array = [ true ]
        validate_bool("false")
        validate_bool("true")
        validate_bool($some_array)

<<<<<<< HEAD
    ENDHEREDOC

    # The deprecation function was being called twice, as validate_bool calls is_bool. I have removed it from here so it only calls deprecation once within is_bool.
    # function_deprecation([:validate_bool, 'This method is deprecated, please use the stdlib validate_legacy function, with Stdlib::Compat::Bool. There is further documentation for validate_legacy function in the README.'])

    unless args.length > 0 then
      raise Puppet::ParseError, ("validate_bool(): wrong number of arguments (#{args.length}; must be > 0)")
=======
    DOC

    if args.empty?
      raise Puppet::ParseError, "validate_bool(): wrong number of arguments (#{args.length}; must be > 0)"
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    end

    args.each do |arg|
      unless function_is_bool([arg])
<<<<<<< HEAD
        raise Puppet::ParseError, ("#{arg.inspect} is not a boolean.  It looks to be a #{arg.class}")
      end
    end

  end

=======
        raise Puppet::ParseError, "#{arg.inspect} is not a boolean.  It looks to be a #{arg.class}"
      end
    end
  end
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
end
