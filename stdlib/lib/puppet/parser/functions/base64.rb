#  Please note: This function is an implementation of a Ruby class and as such may not be entirely UTF8 compatible. To ensure compatibility please use this function with Ruby 2.4.0 or greater - https://bugs.ruby-lang.org/issues/10085.
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
  newfunction(:base64, :type => :rvalue, :doc => <<-'DOC') do |args|
    Base64 encode or decode a string based on the command and the string submitted

    Usage:

      $encodestring = base64('encode', 'thestring')
      $decodestring = base64('decode', 'dGhlc3RyaW5n')

      # explicitly define encode/decode method: default, strict, urlsafe
      $method = 'default'
      $encodestring = base64('encode', 'thestring', $method)
      $decodestring = base64('decode', 'dGhlc3RyaW5n', $method)

<<<<<<< HEAD
    Note: Since Puppet 4.8.0, the Binary data type can be used to produce base 64 encoded strings.
    See the `new()` function for the Binary and String types for documentation. Also see `binary_file()`
    function for reading a file with binary (non UTF-8) content.

       # encode a string as if it was binary
       $encodestring = String(Binary('thestring', '%s'))
       # decode a Binary assuming it is an UTF-8 String
       $decodestring = String(Binary("dGhlc3RyaW5n"), "%s")

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  newfunction(:base64, :type => :rvalue, :doc => <<-DOC) do |args|
    @summary
      Base64 encode or decode a string based on the command and the string submitted

    @example Example usage

      Encode and decode a string

        $encodestring = base64('encode', 'thestring')
        $decodestring = base64('decode', 'dGhlc3RyaW5n')

      Explicitly define encode/decode method: default, strict, urlsafe

        $method = 'default'
        $encodestring = base64('encode', 'thestring', $method)
        $decodestring = base64('decode', 'dGhlc3RyaW5n', $method)

      Encode a string as if it was binary

       $encodestring = String(Binary('thestring', '%s'))

      Decode a Binary assuming it is an UTF-8 String

       $decodestring = String(Binary("dGhlc3RyaW5n"), "%s")

    > **Note:*
        Since Puppet 4.8.0, the Binary data type can be used to produce base 64 encoded strings.
        See the `new()` function for the Binary and String types for documentation. Also see `binary_file()`
        function for reading a file with binary (non UTF-8) content.

    @return [String] The encoded/decoded value
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

    require 'base64'

    raise Puppet::ParseError, "base64(): Wrong number of arguments (#{args.length}; must be >= 2)" unless args.length >= 2

<<<<<<< HEAD
    actions = ['encode', 'decode']
=======
    actions = %w[encode decode]
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

    unless actions.include?(args[0])
      raise Puppet::ParseError, "base64(): the first argument must be one of 'encode' or 'decode'"
    end

    unless args[1].is_a?(String)
      raise Puppet::ParseError, 'base64(): the second argument must be a string to base64'
    end

<<<<<<< HEAD
    method = ['default', 'strict', 'urlsafe']
=======
    method = %w[default strict urlsafe]
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

    chosen_method = if args.length <= 2
                      'default'
                    else
                      args[2]
                    end

    unless method.include?(chosen_method)
      raise Puppet::ParseError, "base64(): the third argument must be one of 'default', 'strict', or 'urlsafe'"
    end

    case args[0]
    when 'encode'
      case chosen_method
      when 'default'
        result = Base64.encode64(args[1])
      when 'strict'
        result = Base64.strict_encode64(args[1])
      when 'urlsafe'
        result = Base64.urlsafe_encode64(args[1])
      end
    when 'decode'
      case chosen_method
      when 'default'
        result = Base64.decode64(args[1])
      when 'strict'
        result = Base64.strict_decode64(args[1])
      when 'urlsafe'
        result = Base64.urlsafe_decode64(args[1])
      end
    end

    return result
  end
end
