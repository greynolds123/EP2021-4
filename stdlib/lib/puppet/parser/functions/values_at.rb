#
# values_at.rb
#
module Puppet::Parser::Functions
  newfunction(:values_at, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Finds value inside an array based on location.
=======
    @summary
      Finds value inside an array based on location.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Finds value inside an array based on location.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Finds value inside an array based on location.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Finds value inside an array based on location.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Finds value inside an array based on location.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

    The first argument is the array you want to analyze, and the second element can
    be a combination of:

    * A single numeric index
    * A range in the form of 'start-stop' (eg. 4-9)
    * An array combining the above

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
    *Examples*:

        values_at(['a','b','c'], 2)

    Would return ['c'].

        values_at(['a','b','c'], ["0-1"])

    Would return ['a','b'].

        values_at(['a','b','c','d','e'], [0, "2-3"])

    Would return ['a','c','d'].
<<<<<<< HEAD

    Note that since Puppet 4.0.0 it is possible to slice an array with index and count directly in the language.
    A negative value is taken to be "from the end" of the array:

        ['a', 'b', 'c', 'd'][1, 2]   # results in ['b', 'c']
        ['a', 'b', 'c', 'd'][2, -1]  # results in ['c', 'd']
        ['a', 'b', 'c', 'd'][1, -2]  # results in ['b', 'c']
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @return
      an array of values identified by location

    @example **Usage**

      values_at(['a','b','c'], 2)
      Would return ['c']

      values_at(['a','b','c'], ["0-1"])
      Would return ['a','b']

      values_at(['a','b','c','d','e'], [0, "2-3"])
      Would return ['a','c','d']

    > *Note:*
    Since Puppet 4.0.0 it is possible to slice an array with index and count directly in the language.
    A negative value is taken to be "from the end" of the array:

    `['a', 'b', 'c', 'd'][1, 2]`   results in `['b', 'c']`
    `['a', 'b', 'c', 'd'][2, -1]`  results in `['c', 'd']`
    `['a', 'b', 'c', 'd'][1, -2]`  results in `['b', 'c']`

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, "values_at(): Wrong number of arguments given (#{arguments.size} for 2)") if arguments.size < 2

    array = arguments.shift

    unless array.is_a?(Array)
      raise(Puppet::ParseError, 'values_at(): Requires array to work with')
    end

    indices = [arguments.shift].flatten # Get them all ... Pokemon ...

    if !indices || indices.empty?
      raise(Puppet::ParseError, 'values_at(): You must provide at least one positive index to collect')
    end

    indices_list = []

    indices.each do |i|
      i = i.to_s
      m = i.match(%r{^(\d+)(\.\.\.?|\-)(\d+)$})
      if m
        start = m[1].to_i
        stop  = m[3].to_i

        type = m[2]

        raise(Puppet::ParseError, 'values_at(): Stop index in given indices range is smaller than the start index') if start > stop
        raise(Puppet::ParseError, 'values_at(): Stop index in given indices range exceeds array size') if stop > array.size - 1 # First element is at index 0 is it not?

        range = case type
                when %r{^(\.\.|\-)$} then (start..stop)
                when %r{^(\.\.\.)$}  then (start...stop) # Exclusive of last element ...
                end

        range.each { |i| indices_list << i.to_i } # rubocop:disable Lint/ShadowingOuterLocalVariable : Value is meant to be shadowed
      else
        # Only positive numbers allowed in this case ...
        unless i =~ %r{^\d+$}
          raise(Puppet::ParseError, 'values_at(): Unknown format of given index')
        end

        # In Puppet numbers are often string-encoded ...
        i = i.to_i

        if i > array.size - 1 # Same story.  First element is at index 0 ...
          raise(Puppet::ParseError, 'values_at(): Given index exceeds array size')
        end

        indices_list << i
      end
    end

    # We remove nil values as they make no sense in Puppet DSL ...
    result = indices_list.map { |i| array[i] }.compact

    return result
  end
end

# vim: set ts=2 sw=2 et :
