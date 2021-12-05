#
# delete_at.rb
#
module Puppet::Parser::Functions
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
  newfunction(:delete_at, :type => :rvalue, :doc => <<-DOC
    Deletes a determined indexed value from an array.

    *Examples:*

        delete_at(['a','b','c'], 1)

    Would return: ['a','c']

    Note that since Puppet 4 this can be done in general with the filter function:

        ['a', 'b', 'c'].filter |$pos, $val | { $pos != 1 }

    Or if a delete is wanted from the beginning or end of the array, by using the slice operator [ ]:

        $array[0, -1] # the same as all the values
        $array[2, -1] # all but the first 2 elements
        $array[0, -3] # all but the last 2 elements
        $array[1, -2] # all but the first and last element
  DOC
             ) do |arguments|
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  newfunction(:delete_at, :type => :rvalue, :doc => <<-DOC) do |arguments|
    @summary
      Deletes a determined indexed value from an array.

    For example
        ```delete_at(['a','b','c'], 1)```

    Would return: `['a','c']`

    > *Note:*
      Since Puppet 4 this can be done in general with the built-in
      [`filter`](https://puppet.com/docs/puppet/latest/function.html#filter) function:

      ```['a', 'b', 'c'].filter |$pos, $val | { $pos != 1 }```

    Or if a delete is wanted from the beginning or end of the array, by using the slice operator [ ]:
      ```
      $array[0, -1] # the same as all the values
      $array[2, -1] # all but the first 2 elements
      $array[0, -3] # all but the last 2 elements
      $array[1, -2] # all but the first and last element
      ```

    @return [Array] The given array, now missing the target value

  DOC
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

    raise(Puppet::ParseError, "delete_at(): Wrong number of arguments given (#{arguments.size} for 2)") if arguments.size < 2

    array = arguments[0]

    unless array.is_a?(Array)
      raise(Puppet::ParseError, 'delete_at(): Requires array to work with')
    end

    index = arguments[1]

    if index.is_a?(String) && !index.match(%r{^\d+$})
      raise(Puppet::ParseError, 'delete_at(): You must provide non-negative numeric index')
    end

    result = array.clone

    # Numbers in Puppet are often string-encoded which is troublesome ...
    index = index.to_i

    if index > result.size - 1 # First element is at index 0 is it not?
      raise(Puppet::ParseError, 'delete_at(): Given index exceeds size of array given')
    end

    result.delete_at(index) # We ignore the element that got deleted ...

    return result
  end
end

# vim: set ts=2 sw=2 et :
