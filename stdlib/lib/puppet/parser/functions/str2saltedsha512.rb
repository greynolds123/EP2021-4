#
#  str2saltedsha512.rb
#  Please note: This function is an implementation of a Ruby class and as such may not be entirely UTF8 compatible. To ensure compatibility please use this function with Ruby 2.4.0 or greater - https://bugs.ruby-lang.org/issues/10085.
#
module Puppet::Parser::Functions
  newfunction(:str2saltedsha512, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    This converts a string to a salted-SHA512 password hash (which is used for
    OS X versions >= 10.7). Given any simple string, you will get a hex version
=======
    @summary
      This converts a string to a salted-SHA512 password hash (which is used for
      OS X versions >= 10.7).

    @return
      converted string as a hex version of a salted-SHA512 password hash

    Given any simple string, you will get a hex version
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    This converts a string to a salted-SHA512 password hash (which is used for
    OS X versions >= 10.7). Given any simple string, you will get a hex version
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    This converts a string to a salted-SHA512 password hash (which is used for
    OS X versions >= 10.7). Given any simple string, you will get a hex version
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    This converts a string to a salted-SHA512 password hash (which is used for
    OS X versions >= 10.7). Given any simple string, you will get a hex version
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    This converts a string to a salted-SHA512 password hash (which is used for
    OS X versions >= 10.7). Given any simple string, you will get a hex version
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    of a salted-SHA512 password hash that can be inserted into your Puppet
    manifests as a valid password attribute.
    DOC
             ) do |arguments|
    require 'digest/sha2'

    raise(Puppet::ParseError, "str2saltedsha512(): Wrong number of arguments passed (#{arguments.size} but we require 1)") if arguments.size != 1

    password = arguments[0]

    unless password.is_a?(String)
      raise(Puppet::ParseError, "str2saltedsha512(): Requires a String argument, you passed: #{password.class}")
    end

    seedint    = rand(2**31 - 1)
    seedstring = Array(seedint).pack('L')
    saltedpass = Digest::SHA512.digest(seedstring + password)
    (seedstring + saltedpass).unpack('H*')[0]
  end
end

# vim: set ts=2 sw=2 et :
