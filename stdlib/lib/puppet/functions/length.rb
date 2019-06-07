<<<<<<< HEAD
# A function to eventually replace the old size() function for stdlib - The original size function did not handle Puppets new type capabilities, so this function is a Puppet 4 compatible solution.
=======
# A function to eventually replace the old size() function for stdlib
# The original size function did not handle Puppets new type capabilities, so this function is a Puppet 4 compatible solution.
#
# Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
# will be used instead of this function.
#
>>>>>>> f661b3a03526f113b1823084ffd4808cf261cf70
Puppet::Functions.create_function(:length) do
  dispatch :length do
    param 'Variant[String,Array,Hash]', :value
  end
  def length(value)
    if value.is_a?(String)
      result = value.length
    elsif value.is_a?(Array) || value.is_a?(Hash)
      result = value.size
    end
    result
  end
end
