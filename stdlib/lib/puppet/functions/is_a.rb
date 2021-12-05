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
# Boolean check to determine whether a variable is of a given data type. This is equivalent to the `=~` type checks.
#
# @example how to check a data type
#   # check a data type
#       foo = 3
#       $bar = [1,2,3]
#       $baz = 'A string!'
#
#       if $foo.is_a(Integer) {
#         notify  { 'foo!': }
#       }
#       if $bar.is_a(Array) {
#         notify { 'bar!': }
#       }
#       if $baz.is_a(String) {
#         notify { 'baz!': }
#       }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
# @summary
#   Boolean check to determine whether a variable is of a given data type.
#   This is equivalent to the `=~` type checks.
#
# @example Example Usage:
#   # check a data type
#     foo = 3
#     $bar = [1,2,3]
#     $baz = 'A string!'
#
#     if $foo.is_a(Integer) {
#       notify  { 'foo!': }
#     }
#     if $bar.is_a(Array) {
#       notify { 'bar!': }
#     }
#     if $baz.is_a(String) {
#       notify { 'baz!': }
#     }
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
#
# See the documentation for "The Puppet Type System" for more information about types.
# See the `assert_type()` function for flexible ways to assert the type of a value.
#
Puppet::Functions.create_function(:is_a) do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  # @param value
  #   The value to be checked
  #
  # @param type
  #   The expected type
  #
  # @return [Boolean]
  #   Return's `true` or `false`.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  dispatch :is_a do
    param 'Any', :value
    param 'Type', :type
  end

  def is_a(value, type) # rubocop:disable Style/PredicateName : Used in to many other places to rename at this time, attempting to refactor caused Rubocop to crash.
    # See puppet's lib/puppet/pops/evaluator/evaluator_impl.rb eval_MatchExpression
    Puppet::Pops::Types::TypeCalculator.instance?(type, value)
  end
end
