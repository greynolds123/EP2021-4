#
# validate_String.rb
#
module Puppet::Parser::Functions
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  newfunction(:validate_string, :doc => <<-'DOC') do |args|
    Validate that all passed values are string data structures. Abort catalog
    compilation if any value fails this check.

    The following values will pass:

        $my_string = "one two"
        validate_string($my_string, 'three')

    The following values will fail, causing compilation to abort:

        validate_string(true)
        validate_string([ 'some', 'array' ])

    Note: validate_string(undef) will not fail in this version of the
    functions API (incl. current and future parser). Instead, use:

        if $var == undef {
          fail('...')
        }

    DOC

<<<<<<< HEAD
<<<<<<< HEAD
=======
  newfunction(:validate_string, :doc => <<-DOC
    @summary
      Validate that all passed values are string data structures

    @return
      Validate that all passed values are string data structures. Failed
      compilation if any value fails this check.

    @example **Usage**
      The following values will pass:

          $my_string = "one two"
          validate_string($my_string, 'three')

      The following values will fail, causing compilation to abort:

          validate_string(true)
          validate_string([ 'some', 'array' ])
    > *Note:*
    Validate_string(undef) will not fail in this version of the
    functions API (incl. current and future parser). Instead, use:
    ```
      if $var == undef {
         fail('...')
        }
    ```
    DOC
             ) do |args|
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    function_deprecation([:validate_string, 'This method is deprecated, please use the stdlib validate_legacy function,
                            with Stdlib::Compat::String. There is further documentation for validate_legacy function in the README.'])

    if args.empty?
      raise Puppet::ParseError, "validate_string(): wrong number of arguments (#{args.length}; must be > 0)"
    end

    args.each do |arg|
      # when called through the v4 API shim, undef gets translated to nil
      unless arg.is_a?(String) || arg.nil?
        raise Puppet::ParseError, "#{arg.inspect} is not a string.  It looks to be a #{arg.class}"
      end
    end
  end
end
