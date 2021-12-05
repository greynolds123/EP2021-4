#
# delete.rb
#
module Puppet::Parser::Functions
  newfunction(:delete, :type => :rvalue, :doc => <<-DOC
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
    Deletes all instances of a given element from an array, substring from a
    string, or key from a hash.

    *Examples:*

        delete(['a','b','c','b'], 'b')
        Would return: ['a','c']

        delete({'a'=>1,'b'=>2,'c'=>3}, 'b')
        Would return: {'a'=>1,'c'=>3}

        delete({'a'=>1,'b'=>2,'c'=>3}, ['b','c'])
        Would return: {'a'=>1}

        delete('abracadabra', 'bra')
        Would return: 'acada'

    Note that from Puppet 4.0.0 the minus (-) operator deletes values from arrays and keys from a hash:

        ['a', 'b', 'c', 'b'] - 'b'
        # would return ['a', 'c']

        {'a'=>1,'b'=>2,'c'=>3} - ['b','c'])
        # would return {'a' => '1'}

    A global delete from a string can be performed with the regsubst() function:

        'abracadabra'.regsubst(/bra/, '', 'G')
        # would return 'acada'

    In general, the filter() function can filter out entries from arrays and hashes based on keys and/or values.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Deletes all instances of a given element from an array, substring from a
      string, or key from a hash.

    @example Example usage

      delete(['a','b','c','b'], 'b')
      Would return: ['a','c']

      delete({'a'=>1,'b'=>2,'c'=>3}, 'b')
      Would return: {'a'=>1,'c'=>3}

      delete({'a'=>1,'b'=>2,'c'=>3}, ['b','c'])
      Would return: {'a'=>1}

      delete('abracadabra', 'bra')
      Would return: 'acada'

      ['a', 'b', 'c', 'b'] - 'b'
      Would return: ['a', 'c']

      {'a'=>1,'b'=>2,'c'=>3} - ['b','c'])
      Would return: {'a' => '1'}

      'abracadabra'.regsubst(/bra/, '', 'G')
      Would return: 'acada'

    > *Note:*
    From Puppet 4.0.0 the minus (-) operator deletes values from arrays and keys from a hash
    `{'a'=>1,'b'=>2,'c'=>3} - ['b','c'])`
    >
    A global delete from a string can be performed with the
    [`regsubst`](https://puppet.com/docs/puppet/latest/function.html#regsubst) function:
    `'abracadabra'.regsubst(/bra/, '', 'G')`

    In general, the built-in [`filter`](https://puppet.com/docs/puppet/latest/function.html#filter)
    function can filter out entries from arrays and hashes based on keys and/or values.

    @return [String] The filtered String, if one was given.
    @return [Hash] The filtered Hash, if one was given.
    @return [Array] The filtered Array, if one was given.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  DOC
             ) do |arguments|

    raise(Puppet::ParseError, "delete(): Wrong number of arguments given #{arguments.size} for 2") unless arguments.size == 2

    collection = arguments[0].dup
    Array(arguments[1]).each do |item|
      case collection
      when Array, Hash
        collection.delete item
      when String
        collection.gsub! item, ''
      else
        raise(TypeError, "delete(): First argument must be an Array, String, or Hash. Given an argument of class #{collection.class}.")
      end
    end
    collection
  end
end

# vim: set ts=2 sw=2 et :
