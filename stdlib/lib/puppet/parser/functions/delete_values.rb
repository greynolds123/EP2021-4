#
# delete_values.rb
#
module Puppet::Parser::Functions
  newfunction(:delete_values, :type => :rvalue, :doc => <<-DOC
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
    Deletes all instances of a given value from a hash.

    *Examples:*

        delete_values({'a'=>'A','b'=>'B','c'=>'C','B'=>'D'}, 'B')

    Would return: {'a'=>'A','c'=>'C','B'=>'D'}

    Note that since Puppet 4.0.0 the equivalent can be performed with the filter() function in Puppet:

        $array.filter |$val| { $val != 'B' }
        $hash.filter |$key, $val| { $val != 'B' }

      DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Deletes all instances of a given value from a hash.

    @example Example usage

      delete_values({'a'=>'A','b'=>'B','c'=>'C','B'=>'D'}, 'B')
      Would return: {'a'=>'A','c'=>'C','B'=>'D'}

    > *Note:*
    Since Puppet 4.0.0 the equivalent can be performed with the
    built-in [`filter`](https://puppet.com/docs/puppet/latest/function.html#filter) function:
    $array.filter |$val| { $val != 'B' }
    $hash.filter |$key, $val| { $val != 'B' }

    @return [Hash] The given hash now missing all instances of the targeted value
    DOC
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
             ) do |arguments|

    raise(Puppet::ParseError, "delete_values(): Wrong number of arguments given (#{arguments.size} of 2)") if arguments.size != 2

    hash, item = arguments

    unless hash.is_a?(Hash)
      raise(TypeError, "delete_values(): First argument must be a Hash. Given an argument of class #{hash.class}.")
    end
    hash.dup.delete_if { |_key, val| item == val }
  end
end
