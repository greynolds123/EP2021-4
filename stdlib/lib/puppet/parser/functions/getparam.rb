# Test whether a given class or definition is defined
require 'puppet/parser/functions'

Puppet::Parser::Functions.newfunction(:getparam,
                                      :type => :rvalue,
                                      :doc => <<-'DOC'
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Returns the value of a resource's parameter.

    @return
      value of a resource's parameter.

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    Takes a resource reference and name of the parameter and
    returns value of resource's parameter. Note that user defined
    resource types are evaluated lazily.

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    *Examples:*

        # define a resource type with a parameter
        define example_resource($param) {
        }

        # declare an instance of that type
        example_resource { "example_resource_instance":
            param => "'the value we are getting in this example''"
        }

        # Because of order of evaluation, a second definition is needed
        # that will be evaluated after the first resource has been declared
        #
        define example_get_param {
          # This will notice the value of the parameter
          notice(getparam(Example_resource["example_resource_instance"], "param"))
        }

        # Declare an instance of the second resource type - this will call notice
        example_get_param { 'show_notify': }

    Would notice: 'the value we are getting in this example'

    Note that since Puppet 4.0.0 it is possible to get a parameter value by using its data type
    and the [ ] operator. The example below is equivalent to a call to getparam():

        Example_resource['example_resource_instance']['param']
<<<<<<< HEAD
=======
    @example Example Usage:

      # define a resource type with a parameter
      define example_resource($param) {
      }

      # declare an instance of that type
      example_resource { "example_resource_instance":
          param => "'the value we are getting in this example''"
      }

      # Because of order of evaluation, a second definition is needed
      # that will be evaluated after the first resource has been declared
      #
      define example_get_param {
        # This will notice the value of the parameter
        notice(getparam(Example_resource["example_resource_instance"], "param"))
      }

      # Declare an instance of the second resource type - this will call notice
      example_get_param { 'show_notify': }

    Would notice: 'the value we are getting in this example'

    > **Note** that since Puppet 4.0.0 it is possible to get a parameter value by using its data type
    and the [ ] operator. The example below is equivalent to a call to getparam():
      ```Example_resource['example_resource_instance']['param']``
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed

  DOC
                                     ) do |vals|
  reference, param = vals
  raise(ArgumentError, 'Must specify a reference') unless reference
  raise(ArgumentError, 'Must specify name of a parameter') unless param && param.instance_of?(String)

  return '' if param.empty?

  resource = findresource(reference.to_s)
  if resource
    return resource[param] unless resource[param].nil?
  end

  return ''
end
