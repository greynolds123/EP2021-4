<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
Puppet::Functions.create_function(:validate_legacy) do
  # The function checks a value against both the target_type (new) and the previous_validation function (old).

=======
# @summary
#   Validate a value against both the target_type (new) and the previous_validation function (old).
Puppet::Functions.create_function(:validate_legacy) do
  # The function checks a value against both the target_type (new) and the previous_validation function (old).
  # @param scope
  #   The main value that will be passed to the method
  # @param target_type
  # @param function_name
  # @param value
  # @param args
  #   Any additional values that are to be passed to the method
  # @return
  #   A boolean value (`true` or `false`) returned from the called function.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
Puppet::Functions.create_function(:validate_legacy) do
  # The function checks a value against both the target_type (new) and the previous_validation function (old).

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
Puppet::Functions.create_function(:validate_legacy) do
  # The function checks a value against both the target_type (new) and the previous_validation function (old).

>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
Puppet::Functions.create_function(:validate_legacy) do
  # The function checks a value against both the target_type (new) and the previous_validation function (old).

>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  dispatch :validate_legacy do
    param 'Any', :scope
    param 'Type', :target_type
    param 'String', :function_name
    param 'Any', :value
    repeated_param 'Any', :args
  end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  # @param scope
  #   The main value that will be passed to the method
  # @param type_string
  # @param function_name
  # @param value
  # @param args Any additional values that are to be passed to the method
  # @return Legacy validation method
  #
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  dispatch :validate_legacy_s do
    param 'Any', :scope
    param 'String', :type_string
    param 'String', :function_name
    param 'Any', :value
    repeated_param 'Any', :args
  end

  # Workaround PUP-4438 (fixed: https://github.com/puppetlabs/puppet/commit/e01c4dc924cd963ff6630008a5200fc6a2023b08#diff-
  #   c937cc584953271bb3d3b3c2cb141790R221) to support puppet < 4.1.0 and puppet < 3.8.1.
  def call(scope, *args)
    manipulated_args = [scope] + args
    self.class.dispatcher.dispatch(self, scope, manipulated_args)
  end

  def validate_legacy_s(scope, type_string, *args)
    t = Puppet::Pops::Types::TypeParser.new.parse(type_string, scope)
    validate_legacy(scope, t, *args)
  end

  def validate_legacy(scope, target_type, function_name, value, *prev_args)
    if assert_type(target_type, value)
      if previous_validation(scope, function_name, value, *prev_args)
        # Silently passes
      else
        Puppet.notice("Accepting previously invalid value for target type '#{target_type}'")
      end
    else
      inferred_type = Puppet::Pops::Types::TypeCalculator.infer_set(value)
      error_msg = Puppet::Pops::Types::TypeMismatchDescriber.new.describe_mismatch("validate_legacy(#{function_name})", target_type, inferred_type)
      if previous_validation(scope, function_name, value, *prev_args)
        call_function('deprecation', 'validate_legacy', error_msg)
      else
        call_function('fail', error_msg)
      end
    end
  end

  def previous_validation(scope, function_name, value, *prev_args)
    # Call the previous validation function and catch any errors. Return true if no errors are thrown.

    scope.send("function_#{function_name}".to_s, [value, *prev_args])
    true
  rescue Puppet::ParseError
    false
  end

  def assert_type(type, value)
    Puppet::Pops::Types::TypeCalculator.instance?(type, value)
  end
end
