Puppet::Functions.create_function(:is_ip_address) do
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
    call_function('deprecation', 'is_ip_address', "This method is deprecated, please use match expressions with Stdlib::Compat::Ip_address instead. They are described at https://docs.puppet.com/puppet/latest/reference/lang_data_type.html#match-expressions.")
    scope.send("function_is_ip_address", args)
=======

  def deprecation_gen(scope, *args)
    call_function('deprecation', 'is_ip_address', 'This method is deprecated, please use match expressions with Stdlib::Compat::Ip_address instead. They are described at https://docs.puppet.com/puppet/latest/reference/lang_data_type.html#match-expressions.')
    scope.send('function_is_ip_address', args)
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
  end
end
