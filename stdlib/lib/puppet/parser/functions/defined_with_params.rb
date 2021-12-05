# Test whether a given class or definition is defined
require 'puppet/parser/functions'

Puppet::Parser::Functions.newfunction(:defined_with_params,
                                      :type => :rvalue,
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
    Takes a resource reference and an optional hash of attributes.

    Returns true if a resource with the specified attributes has already been added
    to the catalog, and false otherwise.

        user { 'dan':
          ensure => present,
        }

        if ! defined_with_params(User[dan], {'ensure' => 'present' }) {
          user { 'dan': ensure => present, }
        }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
                                      :doc => <<-DOC
    @summary
      Takes a resource reference and an optional hash of attributes.

    Returns `true` if a resource with the specified attributes has already been added
    to the catalog, and `false` otherwise.

      ```
      user { 'dan':
        ensure => present,
      }

      if ! defined_with_params(User[dan], {'ensure' => 'present' }) {
        user { 'dan': ensure => present, }
      }
      ```

    @return [Boolean]
      returns `true` or `false`
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
DOC
                                     ) do |vals|
  reference, params = vals
  raise(ArgumentError, 'Must specify a reference') unless reference
  if !params || params == ''
    params = {}
  end
  ret = false

  if Puppet::Util::Package.versioncmp(Puppet.version, '4.6.0') >= 0
    # Workaround for PE-20308
    if reference.is_a?(String)
      type_name, title = Puppet::Resource.type_and_title(reference, nil)
      type = Puppet::Pops::Evaluator::Runtime3ResourceSupport.find_resource_type_or_class(find_global_scope, type_name.downcase)
    elsif reference.is_a?(Puppet::Resource)
<<<<<<< HEAD
      type = reference.type
=======
      type = reference.resource_type
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      title = reference.title
    else
      raise(ArgumentError, "Reference is not understood: '#{reference.class}'")
    end
    # end workaround
  else
    type = reference.to_s
    title = nil
  end

  resource = findresource(type, title)
  if resource
    matches = params.map do |key, value|
      # eql? avoids bugs caused by monkeypatching in puppet
      resource_is_undef = resource[key].eql?(:undef) || resource[key].nil?
      value_is_undef = value.eql?(:undef) || value.nil?
      (resource_is_undef && value_is_undef) || (resource[key] == value)
    end
    ret = params.empty? || !matches.include?(false)
  end
  Puppet.debug("Resource #{reference} was not determined to be defined")
  ret
end
