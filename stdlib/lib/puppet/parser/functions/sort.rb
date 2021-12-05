#
#  sort.rb
#  Please note: This function is an implementation of a Ruby class and as such may not be entirely UTF8 compatible. To ensure compatibility please use this function with Ruby 2.4.0 or greater - https://bugs.ruby-lang.org/issues/10085.
#
module Puppet::Parser::Functions
  newfunction(:sort, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Sorts strings and arrays lexically.
=======
    @summary
      Sorts strings and arrays lexically.

    @return
      sorted string or array
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Sorts strings and arrays lexically.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Sorts strings and arrays lexically.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Sorts strings and arrays lexically.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

    Note that from Puppet 6.0.0 the same function in Puppet will be used instead of this.
  DOC
             ) do |arguments|

    if arguments.size != 1
      raise(Puppet::ParseError, "sort(): Wrong number of arguments given #{arguments.size} for 1")
    end

    value = arguments[0]

    if value.is_a?(Array)
      value.sort
    elsif value.is_a?(String)
      value.split('').sort.join('')
    end
  end
end

# vim: set ts=2 sw=2 et :
