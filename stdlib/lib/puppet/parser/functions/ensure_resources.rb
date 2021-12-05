require 'puppet/parser/functions'

Puppet::Parser::Functions.newfunction(:ensure_resources,
                                      :type => :statement,
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
                                      :doc => <<-'DOC'
    Takes a resource type, title (only hash), and a list of attributes that describe a
    resource.

<<<<<<< HEAD
<<<<<<< HEAD
=======
                                      :doc => <<-DOC
  @summary
    Takes a resource type, title (only hash), and a list of attributes that describe a
    resource.

  @return
    created resources with the passed type and attributes

  @example Example usage

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
        user { 'dan':
          gid => 'mygroup',
          ensure => present,
        }

    An hash of resources should be passed in and each will be created with
    the type and parameters specified if it doesn't already exist.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        ensure_resources('user', {'dan' => { gid => 'mygroup', uid => '600' } ,  'alex' => { gid => 'mygroup' }}, {'ensure' => 'present'})
=======
    ensure_resources('user', {'dan' => { gid => 'mygroup', uid => '600' }, 'alex' => { gid => 'mygroup' }}, {'ensure' => 'present'})
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
        ensure_resources('user', {'dan' => { gid => 'mygroup', uid => '600' } ,  'alex' => { gid => 'mygroup' }}, {'ensure' => 'present'})
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
        ensure_resources('user', {'dan' => { gid => 'mygroup', uid => '600' } ,  'alex' => { gid => 'mygroup' }}, {'ensure' => 'present'})
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97

    From Hiera Backend:

    userlist:
      dan:
        gid: 'mygroup'
     uid: '600'
      alex:
     gid: 'mygroup'

    Call:
    ensure_resources('user', hiera_hash('userlist'), {'ensure' => 'present'})
DOC
                                     ) do |vals|
  type, title, params = vals
  raise(ArgumentError, 'Must specify a type') unless type
  raise(ArgumentError, 'Must specify a title') unless title
  params ||= {}

  raise(Puppet::ParseError, 'ensure_resources(): Requires second argument to be a Hash') unless title.is_a?(Hash)
  resource_hash = title.dup
  resources = resource_hash.keys

  Puppet::Parser::Functions.function(:ensure_resource)
  resources.each do |resource_name|
    params_merged = if resource_hash[resource_name]
                      params.merge(resource_hash[resource_name])
                    else
                      params
                    end
    function_ensure_resource([type, resource_name, params_merged])
  end
end
