#
#  delete_regex.rb
#  Please note: This function is an implementation of a Ruby class and as such may not be entirely UTF8 compatible. To ensure compatibility please use this function with Ruby 2.4.0 or greater - https://bugs.ruby-lang.org/issues/10085.
#
module Puppet::Parser::Functions
  newfunction(:delete_regex, :type => :rvalue, :doc => <<-DOC
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
    deletes all instances of a given element that match a regular expression
    from an array or key from a hash. Multiple regular expressions are assumed
    to be matched as an OR.

    *Examples:*
<<<<<<< HEAD

        delete_regex(['a','b','c','b'], 'b')
        Would return: ['a','c']

        delete_regex(['a','b','c','b'], ['b', 'c'])
        Would return: ['a']

        delete_regex({'a'=>1,'b'=>2,'c'=>3}, 'b')
        Would return: {'a'=>1,'c'=>3}

        delete_regex({'a'=>1,'b'=>2,'c'=>3}, '^a$')
        Would return: {'b'=>2,'c'=>3}

     Note that since Puppet 4 this can be done in general with the filter function:

        ["aaa", "aba", "aca"].filter |$val| { $val !~ /b/ }
        # Would return: ['aaa', 'aca']


<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Deletes all instances of a given element that match a regular expression
      from an array or key from a hash.

    Multiple regular expressions are assumed to be matched as an OR.

    @example Example usage

      delete_regex(['a','b','c','b'], 'b')
      Would return: ['a','c']

      delete_regex(['a','b','c','b'], ['b', 'c'])
      Would return: ['a']

      delete_regex({'a'=>1,'b'=>2,'c'=>3}, 'b')
      Would return: {'a'=>1,'c'=>3}

      delete_regex({'a'=>1,'b'=>2,'c'=>3}, '^a$')
      Would return: {'b'=>2,'c'=>3}

    > *Note:*
    Since Puppet 4 this can be done in general with the built-in
    [`filter`](https://puppet.com/docs/puppet/latest/function.html#filter) function:
    ["aaa", "aba", "aca"].filter |$val| { $val !~ /b/ }
    Would return: ['aaa', 'aca']

    @return [Array] The given array now missing all targeted values.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======

        delete_regex(['a','b','c','b'], 'b')
        Would return: ['a','c']

        delete_regex(['a','b','c','b'], ['b', 'c'])
        Would return: ['a']

        delete_regex({'a'=>1,'b'=>2,'c'=>3}, 'b')
        Would return: {'a'=>1,'c'=>3}

        delete_regex({'a'=>1,'b'=>2,'c'=>3}, '^a$')
        Would return: {'b'=>2,'c'=>3}

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  DOC
             ) do |arguments|

    raise(Puppet::ParseError, "delete_regex(): Wrong number of arguments given #{arguments.size} for 2") unless arguments.size == 2

    collection = arguments[0].dup
    Array(arguments[1]).each do |item|
      case collection
      when Array, Hash, String
        collection.reject! { |coll_item| (coll_item =~ %r{\b#{item}\b}) }
      else
        raise(TypeError, "delete_regex(): First argument must be an Array, Hash, or String. Given an argument of class #{collection.class}.")
      end
    end
    collection
  end
end

# vim: set ts=2 sw=2 et :
