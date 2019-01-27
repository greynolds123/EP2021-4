# Returns the type when passed a value.
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
<<<<<<< HEAD
=======
# The built-in type() function in puppet is generally preferred over this function
# this function is provided for backwards compatibility.
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
Puppet::Functions.create_function(:type_of) do
  def type_of(value)
    Puppet::Pops::Types::TypeCalculator.infer_set(value)
  end
end
