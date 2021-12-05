#
# validate_array.rb
#
module Puppet::Parser::Functions
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
  newfunction(:validate_array, :doc => <<-'DOC') do |args|
    Validate that all passed values are array data structures. Abort catalog
    compilation if any value fails this check.

    The following values will pass:

        $my_array = [ 'one', 'two' ]
        validate_array($my_array)

    The following values will fail, causing compilation to abort:

        validate_array(true)
        validate_array('some_string')
        $undefined = undef
        validate_array($undefined)

    DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  newfunction(:validate_array, :doc => <<-DOC) do |args|
    @summary
      Validate that all passed values are array data structures. Abort catalog
      compilation if any value fails this check.

    @return
      validate array

    @example **Usage**
      The following values will pass:

          $my_array = [ 'one', 'two' ]
          validate_array($my_array)

      The following values will fail, causing compilation to abort:

          validate_array(true)
          validate_array('some_string')
          $undefined = undef
          validate_array($undefined)
      DOC
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

    function_deprecation([:validate_array, 'This method is deprecated, please use the stdlib validate_legacy function,
      with Stdlib::Compat::Array. There is further documentation for validate_legacy function in the README.'])

=======

    function_deprecation([:validate_array, 'This method is deprecated, please use the stdlib validate_legacy function,
      with Stdlib::Compat::Array. There is further documentation for validate_legacy function in the README.'])

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    if args.empty?
      raise Puppet::ParseError, "validate_array(): wrong number of arguments (#{args.length}; must be > 0)"
    end

    args.each do |arg|
      unless arg.is_a?(Array)
        raise Puppet::ParseError, "#{arg.inspect} is not an Array.  It looks to be a #{arg.class}"
      end
    end
  end
end
