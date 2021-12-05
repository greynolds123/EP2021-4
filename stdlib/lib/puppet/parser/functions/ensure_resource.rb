# Test whether a given class or definition is defined
require 'puppet/parser/functions'

Puppet::Parser::Functions.newfunction(:ensure_resource,
                                      :type => :statement,
<<<<<<< HEAD
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
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
                                      :doc => <<-'DOC'
    Takes a resource type, title, and a list of attributes that describe a
    resource.

        user { 'dan':
          ensure => present,
        }

    This example only creates the resource if it does not already exist:

        ensure_resource('user', 'dan', {'ensure' => 'present' })
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
                                      :doc => <<-DOC
  @summary
    Takes a resource type, title, and a list of attributes that describe a
    resource.

  user { 'dan':
    ensure => present,
  }

  @return
    created or recreated the passed resource with the passed type and attributes

  @example Example usage

    Creates the resource if it does not already exist:

      ensure_resource('user', 'dan', {'ensure' => 'present' })
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

    If the resource already exists but does not match the specified parameters,
    this function will attempt to recreate the resource leading to a duplicate
    resource definition error.

    An array of resources can also be passed in and each will be created with
    the type and parameters specified if it doesn't already exist.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        ensure_resource('user', ['dan','alex'], {'ensure' => 'present'})
=======
      ensure_resource('user', ['dan','alex'], {'ensure' => 'present'})
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
        ensure_resource('user', ['dan','alex'], {'ensure' => 'present'})
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
        ensure_resource('user', ['dan','alex'], {'ensure' => 'present'})
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
        ensure_resource('user', ['dan','alex'], {'ensure' => 'present'})
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

=======

    If the resource already exists but does not match the specified parameters,
    this function will attempt to recreate the resource leading to a duplicate
    resource definition error.

    An array of resources can also be passed in and each will be created with
    the type and parameters specified if it doesn't already exist.

        ensure_resource('user', ['dan','alex'], {'ensure' => 'present'})

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
DOC
                                     ) do |vals|
  type, title, params = vals
  raise(ArgumentError, 'Must specify a type') unless type
  raise(ArgumentError, 'Must specify a title') unless title
  params ||= {}

  items = [title].flatten

  items.each do |item|
    Puppet::Parser::Functions.function(:defined_with_params)
    if function_defined_with_params(["#{type}[#{item}]", params])
      Puppet.debug("Resource #{type}[#{item}] with params #{params} not created because it already exists")
    else
      Puppet.debug("Create new resource #{type}[#{item}] with params #{params}")
      Puppet::Parser::Functions.function(:create_resources)
      function_create_resources([type.capitalize, { item => params }])
    end
  end
end
