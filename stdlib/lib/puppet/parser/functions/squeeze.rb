#
# squeeze.rb
#
<<<<<<< HEAD

module Puppet::Parser::Functions
  newfunction(:squeeze, :type => :rvalue, :doc => <<-EOS
Returns a new string where runs of the same character that occur in this set are replaced by a single character.
    EOS
  ) do |arguments|

    if ((arguments.size != 2) and (arguments.size != 1)) then
      raise(Puppet::ParseError, "squeeze(): Wrong number of arguments "+
        "given #{arguments.size} for 2 or 1")
=======
module Puppet::Parser::Functions
  newfunction(:squeeze, :type => :rvalue, :doc => <<-DOC
    Returns a new string where runs of the same character that occur in this set are replaced by a single character.
  DOC
             ) do |arguments|

    if (arguments.size != 2) && (arguments.size != 1)
      raise(Puppet::ParseError, "squeeze(): Wrong number of arguments given #{arguments.size} for 2 or 1")
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
    end

    item = arguments[0]
    squeezeval = arguments[1]

<<<<<<< HEAD
    if item.is_a?(Array) then
      if squeezeval then
        item.collect { |i| i.squeeze(squeezeval) }
      else
        item.collect { |i| i.squeeze }
      end
    else
      if squeezeval then
        item.squeeze(squeezeval)
      else
        item.squeeze
      end
    end

=======
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
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
  end
end

# vim: set ts=2 sw=2 et :
