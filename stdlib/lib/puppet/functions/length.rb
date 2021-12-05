<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
# A function to eventually replace the old size() function for stdlib
# The original size function did not handle Puppets new type capabilities, so this function is a Puppet 4 compatible solution.
#
# Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
# will be used instead of this function.
#
Puppet::Functions.create_function(:length) do
<<<<<<< HEAD
=======
# @summary
#   **Deprecated:** A function to eventually replace the old size() function for stdlib
#
# The original size() function did not handle Puppets new type capabilities, so this function
# is a Puppet 4 compatible solution.
#
# > **Note:** **Deprecated** from Puppet 6.0.0, this function has been replaced with a
# built-in [`length`](https://puppet.com/docs/puppet/latest/function.html#length) function.
#
Puppet::Functions.create_function(:length) do
  # @param value
  #   The value whose length is to be found
  #
  # @return [Integer]
  #   The length of the given object
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
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
