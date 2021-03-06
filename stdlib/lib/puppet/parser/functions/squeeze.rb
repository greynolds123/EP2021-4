#
# squeeze.rb
#
module Puppet::Parser::Functions
  newfunction(:squeeze, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns a new string where runs of the same character that occur in this set are replaced by a single character.
=======
    @summary
      Returns a new string where runs of the same character that occur in this set are replaced by a single character.

    @return
      a new string where runs of the same character that occur in this set are replaced by a single character.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns a new string where runs of the same character that occur in this set are replaced by a single character.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns a new string where runs of the same character that occur in this set are replaced by a single character.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns a new string where runs of the same character that occur in this set are replaced by a single character.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Returns a new string where runs of the same character that occur in this set are replaced by a single character.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  DOC
             ) do |arguments|

    if (arguments.size != 2) && (arguments.size != 1)
      raise(Puppet::ParseError, "squeeze(): Wrong number of arguments given #{arguments.size} for 2 or 1")
    end

    item = arguments[0]
    squeezeval = arguments[1]

    if item.is_a?(Array)
      if squeezeval
        item.map { |i| i.squeeze(squeezeval) }
      else
        item.map { |i| i.squeeze }
      end
    elsif squeezeval
      item.squeeze(squeezeval)
    else
      item.squeeze
    end
  end
end

# vim: set ts=2 sw=2 et :
