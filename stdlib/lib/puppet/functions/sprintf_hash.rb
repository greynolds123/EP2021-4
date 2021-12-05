<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# Uses sprintf with named references.
=======
# @summary
#  Uses sprintf with named references.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
# Uses sprintf with named references.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
# Uses sprintf with named references.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
# Uses sprintf with named references.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
#
# The first parameter is format string describing how the rest of the parameters in the hash
# should be formatted. See the documentation for the `Kernel::sprintf` function in Ruby for
# all the details.
#
# In the given argument hash with parameters, all keys are converted to symbols so they work
# with the `sprintf` function.
#
# @example Format a string and number
#   $output = sprintf_hash('String: %<foo>s / number converted to binary: %<number>b',
#                          { 'foo' => 'a string', 'number' => 5 })
#   # $output = 'String: a string / number converted to binary: 101'
#
# Note that since Puppet 4.10.10, and 5.3.4 this functionality is supported by the
# `sprintf` function in puppet core.
#
Puppet::Functions.create_function(:sprintf_hash) do
  # @param format The format to use.
  # @param arguments Hash with parameters.
  # @return The formatted string.
  dispatch :sprintf_hash do
    param 'String', :format
    param 'Hash', :arguments
    # Disabled for now. This gives issues on puppet 4.7.1.
    # return_type 'String'
  end

  def sprintf_hash(format, arguments)
    call_function('deprecation', 'sprintf_hash', 'This method is deprecated. From Puppet 4.10.10/5.3.4 please use the built-in sprintf instead')

    Kernel.sprintf(format, Hash[arguments.map { |(k, v)| [k.to_sym, v] }])
  end
end
