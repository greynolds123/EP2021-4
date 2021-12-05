#
# validate_bool.rb
#
module Puppet::Parser::Functions
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  newfunction(:validate_bool, :doc => <<-'DOC') do |args|
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

    DOC

<<<<<<< HEAD
=======
  newfunction(:validate_bool, :doc => <<-DOC
    @summary
      Validate that all passed values are either true or false. Abort catalog
      compilation if any value fails this check.

    @return
      validate boolean

    @example **Usage**

      The following values will pass:

          $iamtrue = true
          validate_bool(true)
          validate_bool(true, true, false, $iamtrue)

      The following values will fail, causing compilation to abort:

          $some_array = [ true ]
          validate_bool("false")
          validate_bool("true")
          validate_bool($some_array)
      DOC
             ) do |args|
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    if args.empty?
      raise Puppet::ParseError, "validate_bool(): wrong number of arguments (#{args.length}; must be > 0)"
    end

    args.each do |arg|
      unless function_is_bool([arg])
        raise Puppet::ParseError, "#{arg.inspect} is not a boolean.  It looks to be a #{arg.class}"
      end
    end
  end
end
