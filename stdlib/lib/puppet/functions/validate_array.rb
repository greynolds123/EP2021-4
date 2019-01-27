Puppet::Functions.create_function(:validate_array) do
  dispatch :deprecation_gen do
    param 'Any', :scope
    repeated_param 'Any', :args
  end
<<<<<<< HEAD
  # Workaround PUP-4438 (fixed: https://github.com/puppetlabs/puppet/commit/e01c4dc924cd963ff6630008a5200fc6a2023b08#diff-c937cc584953271bb3d3b3c2cb141790R221) to support puppet < 4.1.0 and puppet < 3.8.1.
=======
  # Workaround PUP-4438 (fixed: https://github.com/puppetlabs/puppet/commit/e01c4dc924cd963ff6630008a5200fc6a2023b08#diff
  #   -c937cc584953271bb3d3b3c2cb141790R221) to support puppet < 4.1.0 and puppet < 3.8.1.
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
  def call(scope, *args)
    manipulated_args = [scope] + args
    self.class.dispatcher.dispatch(self, scope, manipulated_args)
  end
<<<<<<< HEAD
  def deprecation_gen(scope, *args)
    call_function('deprecation', 'validate_array', "This method is deprecated, please use the stdlib validate_legacy function, with Stdlib::Compat::Array. There is further documentation for validate_legacy function in the README.")
    scope.send("function_validate_array", args)
=======

  def deprecation_gen(scope, *args)
    call_function('deprecation', 'validate_array', 'This method is deprecated, please use the stdlib validate_legacy function,
                    with Stdlib::Compat::Array. There is further documentation for validate_legacy function in the README.')
    scope.send('function_validate_array', args)
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
  end
end
