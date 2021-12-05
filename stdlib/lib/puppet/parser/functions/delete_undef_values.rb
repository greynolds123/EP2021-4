#
# delete_undef_values.rb
#
module Puppet::Parser::Functions
  newfunction(:delete_undef_values, :type => :rvalue, :doc => <<-DOC
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
    Returns a copy of input hash or array with all undefs deleted.

    *Examples:*

        $hash = delete_undef_values({a=>'A', b=>'', c=>undef, d => false})

    Would return: {a => 'A', b => '', d => false}

        $array = delete_undef_values(['A','',undef,false])

    Would return: ['A','',false]

<<<<<<< HEAD
    Note that since Puppet 4.0.0 the equivalent can be performed with the filter() function in Puppet:

        $array.filter |$val| { $val =~ NotUndef }
        $hash.filter |$key, $val| { $val =~ NotUndef }

      DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Returns a copy of input hash or array with all undefs deleted.

    @example Example usage

      $hash = delete_undef_values({a=>'A', b=>'', c=>undef, d => false})
      Would return: {a => 'A', b => '', d => false}

      While:
      $array = delete_undef_values(['A','',undef,false])
      Would return: ['A','',false]

    > *Note:*
    Since Puppet 4.0.0 the equivalent can be performed with the built-in
    [`filter`](https://puppet.com/docs/puppet/latest/function.html#filter) function:
    $array.filter |$val| { $val =~ NotUndef }
    $hash.filter |$key, $val| { $val =~ NotUndef }

    @return [Array] The given array now issing of undefined values.
    DOC
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
             ) do |args|

    raise(Puppet::ParseError, "delete_undef_values(): Wrong number of arguments given (#{args.size})") if args.empty?

=======
      DOC
             ) do |args|

    raise(Puppet::ParseError, "delete_undef_values(): Wrong number of arguments given (#{args.size})") if args.empty?

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    unless args[0].is_a?(Array) || args[0].is_a?(Hash)
      raise(Puppet::ParseError, "delete_undef_values(): expected an array or hash, got #{args[0]} type  #{args[0].class} ")
    end
    result = args[0].dup
    if result.is_a?(Hash)
<<<<<<< HEAD
      result.delete_if { |_, val| val.equal?(:undef) || val.nil? }
=======
      result.delete_if { |_key, val| val.equal? :undef }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    elsif result.is_a?(Array)
      result.delete :undef
      result.delete nil
    end
    result
  end
end
