#
# range.rb
#
# TODO(Krzysztof Wilczynski): We probably need to approach numeric values differently ...
module Puppet::Parser::Functions
  newfunction(:range, :type => :rvalue, :doc => <<-DOC
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
    When given range in the form of (start, stop) it will extrapolate a range as
    an array.

    *Examples:*

        range("0", "9")

    Will return: [0,1,2,3,4,5,6,7,8,9]

        range("00", "09")

    Will return: [0,1,2,3,4,5,6,7,8,9] (Zero padded strings are converted to
    integers automatically)

        range("a", "c")

    Will return: ["a","b","c"]

        range("host01", "host10")
    Will return: ["host01", "host02", ..., "host09", "host10"]
    NB Be explicit in including trailing zeros. Otherwise the underlying ruby function will fail.

    Passing a third argument will cause the generated range to step by that
    interval, e.g.

        range("0", "9", "2")

    Will return: [0,2,4,6,8]

    The Puppet Language support Integer and Float ranges by using the type system. Those are suitable for
    iterating a given number of times. Also see the step() function in Puppet for skipping values.

        Integer[0, 9].each |$x| { notice($x) } # notices 0, 1, 2, ... 9
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      When given range in the form of (start, stop) it will extrapolate a range as
      an array.

    @return
      the range is extrapolated as an array

    @example **Usage**
      range("0", "9")
      Will return: [0,1,2,3,4,5,6,7,8,9]

      range("00", "09")
      Will return: [0,1,2,3,4,5,6,7,8,9]
      (Zero padded strings are converted to integers automatically)

      range("a", "c")
      Will return: ["a","b","c"]

      range("host01", "host10")
      Will return: ["host01", "host02", ..., "host09", "host10"]

      range("0", "9", "2")
      Will return: [0,2,4,6,8]

    NB Be explicit in including trailing zeros. Otherwise the underlying ruby function will fail.

    > *Note:*
      Passing a third argument will cause the generated range to step by that
      interval, e.g.

    The Puppet Language support Integer and Float ranges by using the type system. Those are suitable for
    iterating a given number of times.

    @see
      the step() function in Puppet for skipping values.

     Integer[0, 9].each |$x| { notice($x) } # notices 0, 1, 2, ... 9
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
    When given range in the form of (start, stop) it will extrapolate a range as
    an array.

    *Examples:*

        range("0", "9")

    Will return: [0,1,2,3,4,5,6,7,8,9]

        range("00", "09")

    Will return: [0,1,2,3,4,5,6,7,8,9] (Zero padded strings are converted to
    integers automatically)

        range("a", "c")

    Will return: ["a","b","c"]

        range("host01", "host10")
    Will return: ["host01", "host02", ..., "host09", "host10"]
    NB Be explicit in including trailing zeros. Otherwise the underlying ruby function will fail.

    Passing a third argument will cause the generated range to step by that
    interval, e.g.

        range("0", "9", "2")

    Will return: [0,2,4,6,8]
    DOC
             ) do |arguments|

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    raise(Puppet::ParseError, 'range(): Wrong number of arguments given (0 for 1)') if arguments.empty?

    if arguments.size > 1
      start = arguments[0]
      stop  = arguments[1]
      step  = arguments[2].nil? ? 1 : arguments[2].to_i.abs

      type = '..' # Use the simplest type of Range available in Ruby

    else # arguments.size == 1
      value = arguments[0]

      m = value.match(%r{^(\w+)(\.\.\.?|\-)(\w+)$})
      if m
        start = m[1]
        stop  = m[3]

        type = m[2]
        step = 1
      elsif value =~ %r{^.+$}
        raise(Puppet::ParseError, "range(): Unable to compute range from the value: #{value}")
      else
        raise(Puppet::ParseError, "range(): Unknown range format: #{value}")
      end
    end

    # If we were given an integer, ensure we work with one
    if start.to_s =~ %r{^\d+$}
      start = start.to_i
      stop  = stop.to_i
    else
      start = start.to_s
      stop  = stop.to_s
    end

    range = case type
            when %r{^(..|-)$} then (start..stop)
            when '...' then (start...stop) # Exclusive of last element
            end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    result = range.step(step).to_a
=======
    result = range.step(step).first(1_000_000).to_a
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    result = range.step(step).to_a
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    result = range.step(step).to_a
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    result = range.step(step).to_a
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

    return result
  end
end

# vim: set ts=2 sw=2 et :
