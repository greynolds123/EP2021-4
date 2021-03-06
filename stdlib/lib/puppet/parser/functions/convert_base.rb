#
# convert_base.rb
#
module Puppet::Parser::Functions
  newfunction(:convert_base, :type => :rvalue, :arity => 2, :doc => <<-'DOC') do |args|
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
    Converts a given integer or base 10 string representing an integer to a specified base, as a string.

    Usage:

      $binary_repr = convert_base(5, 2)  # $binary_repr is now set to "101"
      $hex_repr = convert_base("254", "16")  # $hex_repr is now set to "fe"

<<<<<<< HEAD
     Note: Since Puppet 4.5.0 this can be done with String.new() and its many formatting options:

       $binary_repr = String(5, '%b') # results in "101"
       $hex_repr = String(254, "%x")  # results in "fe"
       $hex_repr = String(254, "%#x")  # results in "0xfe"
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Converts a given integer or base 10 string representing an integer to a
      specified base, as a string.

    @return
      converted value as a string

    @example Example usage

    convert_base(5, 2)` results in: `'101'`
    convert_base('254', '16')` results in: `'fe'`

    > *Note:*
      Since Puppet 4.5.0 this can be done with the built-in
      [`String.new`](https://puppet.com/docs/puppet/latest/function.html#integer-to-string)
      function and its many formatting options:

      `$binary_repr = String(5, '%b')` return `"101"`
      `$hex_repr = String(254, "%x")`  return `"fe"`
      `$hex_repr = String(254, "%#x")` return `"0xfe"`

      @return [String] The converted value as a String
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

    raise Puppet::ParseError, 'convert_base(): First argument must be either a string or an integer' unless args[0].is_a?(Integer) || args[0].is_a?(String)
    raise Puppet::ParseError, 'convert_base(): Second argument must be either a string or an integer' unless args[1].is_a?(Integer) || args[1].is_a?(String)

    if args[0].is_a?(String)
      raise Puppet::ParseError, 'convert_base(): First argument must be an integer or a string corresponding to an integer in base 10' unless args[0] =~ %r{^[0-9]+$}
    end

    if args[1].is_a?(String)
      raise Puppet::ParseError, 'convert_base(): First argument must be an integer or a string corresponding to an integer in base 10' unless args[1] =~ %r{^[0-9]+$}
    end

    number_to_convert = args[0]
    new_base = args[1]

    number_to_convert = number_to_convert.to_i
    new_base = new_base.to_i

    raise Puppet::ParseError, 'convert_base(): base must be at least 2 and must not be greater than 36' unless new_base >= 2 && new_base <= 36

    return number_to_convert.to_s(new_base)
  end
end
