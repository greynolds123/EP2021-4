<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# Returns the type when passed a value.
=======
# @summary
#   Returns the type of the passed value.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
# Returns the type when passed a value.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
# Returns the type when passed a value.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
#
# @example how to compare values' types
#   # compare the types of two values
#   if type_of($first_value) != type_of($second_value) { fail("first_value and second_value are different types") }
# @example how to compare against an abstract type
#   unless type_of($first_value) <= Numeric { fail("first_value must be Numeric") }
#   unless type_of{$first_value) <= Collection[1] { fail("first_value must be an Array or Hash, and contain at least one element") }
#
# See the documentation for "The Puppet Type System" for more information about types.
# See the `assert_type()` function for flexible ways to assert the type of a value.
#
# The built-in type() function in puppet is generally preferred over this function
# this function is provided for backwards compatibility.
Puppet::Functions.create_function(:type_of) do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  # @return [String]
  #   the type of the passed value
  #
  # @param value
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  def type_of(value)
    Puppet::Pops::Types::TypeCalculator.infer_set(value)
  end
end
