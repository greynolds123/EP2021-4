#
# validate_slength.rb
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
  newfunction(:validate_slength, :doc => <<-'DOC') do |args|
    Validate that the first argument is a string (or an array of strings), and
    less/equal to than the length of the second argument. An optional third
    parameter can be given the minimum length. It fails if the first
    argument is not a string or array of strings, and if arg 2 and arg 3 are
    not convertable to a number.

    The following values will pass:

      validate_slength("discombobulate",17)
      validate_slength(["discombobulate","moo"],17)
      validate_slength(["discombobulate","moo"],17,3)

    The following valueis will not:

      validate_slength("discombobulate",1)
      validate_slength(["discombobulate","thermometer"],5)
      validate_slength(["discombobulate","moo"],17,10)

    DOC
<<<<<<< HEAD

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  newfunction(:validate_slength, :doc => <<-DOC
    @summary
      Validate that the first argument is a string (or an array of strings), and less/equal to than the length of the second argument.
      An optional third parameter can be given the minimum length. It fails if the first argument is not a string or array of strings,
      and if arg 2 and arg 3 are not convertable to a number.

    @return
      validate that the first argument is a string (or an array of strings), and less/equal to than the length of the second argument. Fail compilation if any of the checks fail.

    @example **Usage**
      The following values will pass:

        validate_slength("discombobulate",17)
        validate_slength(["discombobulate","moo"],17)
        validate_slength(["discombobulate","moo"],17,3)

      The following valueis will not:

        validate_slength("discombobulate",1)
        validate_slength(["discombobulate","thermometer"],5)
        validate_slength(["discombobulate","moo"],17,10)
    DOC
             ) do |args|
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    function_deprecation([:validate_slength, 'This method is deprecated, please use the stdlib validate_legacy function,
                            with String[]. There is further documentation for validate_legacy function in the README.'])

=======

    function_deprecation([:validate_slength, 'This method is deprecated, please use the stdlib validate_legacy function,
                            with String[]. There is further documentation for validate_legacy function in the README.'])

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    raise Puppet::ParseError, "validate_slength(): Wrong number of arguments (#{args.length}; must be 2 or 3)" unless args.length == 2 || args.length == 3

    input, max_length, min_length = *args

    begin
      max_length = Integer(max_length)
      raise ArgumentError if max_length <= 0
    rescue ArgumentError, TypeError
      raise Puppet::ParseError, "validate_slength(): Expected second argument to be a positive Numeric, got #{max_length}:#{max_length.class}"
    end

    if min_length
      begin
        min_length = Integer(min_length)
        raise ArgumentError if min_length < 0
      rescue ArgumentError, TypeError
        raise Puppet::ParseError, "validate_slength(): Expected third argument to be unset or a positive Numeric, got #{min_length}:#{min_length.class}"
      end
    else
      min_length = 0
    end

    raise Puppet::ParseError, 'validate_slength(): Expected second argument to be equal to or larger than third argument' unless max_length >= min_length

    validator = ->(str) do
      unless str.length <= max_length && str.length >= min_length
        raise Puppet::ParseError, "validate_slength(): Expected length of #{input.inspect} to be between #{min_length} and #{max_length}, was #{input.length}"
      end
    end

    case input
    when String
      validator.call(input)
    when Array
      input.each_with_index do |arg, pos|
        raise Puppet::ParseError, "validate_slength(): Expected element at array position #{pos} to be a String, got #{arg.class}" unless arg.is_a? String
        validator.call(arg)
      end
    else
      raise Puppet::ParseError, "validate_slength(): Expected first argument to be a String or Array, got #{input.class}"
    end
  end
end
