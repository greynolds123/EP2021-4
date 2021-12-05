#
# count.rb
#
module Puppet::Parser::Functions
  newfunction(:count, :type => :rvalue, :arity => -2, :doc => <<-DOC
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
    Takes an array as first argument and an optional second argument.
    Count the number of elements in array that is equal to the second argument.
    If called with only an array, it counts the number of elements that are not nil/undef/empty-string.

    Note: equality is tested with a Ruby method and it is therefore subject to what Ruby considers
    to be equal. For strings this means that equality is case sensitive.

    In Puppet core, counting can be done in general by using a combination of the core functions
    filter() (since Puppet 4.0.0) and length() (since Puppet 5.5.0, before that in stdlib).
    Example below shows counting values that are not undef.

      notice([42, "hello", undef].filter |$x| { $x =~ NotUndef }.length)

    Would notice the value 2.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Counts the number of elements in array.

    Takes an array as first argument and an optional second argument. Counts the number of elements in array that is equal to the second argument.
    If called with only an array, it counts the number of elements that are not nil/undef/empty-string.

    > *Note:*
      equality is tested with a Ruby method and it is therefore subject to what Ruby considers
      to be equal. For strings this means that equality is case sensitive.

    In Puppet core, counting can be done in general by using a combination of the core functions
    filter() (since Puppet 4.0.0) and length() (since Puppet 5.5.0, before that in stdlib).

    Example below shows counting values that are not undef.

      ```notice([42, "hello", undef].filter |$x| { $x =~ NotUndef }.length)```

    Would notice the value 2.

    @return [Integer] The amount of elements counted within the array
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  DOC
             ) do |args|

    if args.size > 2
      raise(ArgumentError, "count(): Wrong number of arguments given #{args.size} for 1 or 2.")
    end

    collection, item = args

    if item
      collection.count item
    else
      collection.count { |obj| !obj.nil? && obj != :undef && obj != '' }
    end
  end
end
