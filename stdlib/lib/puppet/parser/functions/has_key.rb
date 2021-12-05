#
# has_key.rb
#
module Puppet::Parser::Functions
  newfunction(:has_key, :type => :rvalue, :doc => <<-'DOC') do |args|
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
    Determine if a hash has a certain key value.

    Example:

        $my_hash = {'key_one' => 'value_one'}
        if has_key($my_hash, 'key_two') {
          notice('we will not reach here')
        }
        if has_key($my_hash, 'key_one') {
          notice('this will be printed')
        }

<<<<<<< HEAD
    Note: Since Puppet 4.0.0 this can be achieved in the Puppet language with the following equivalent expression:

       $my_hash = {'key_one' => 'value_one'}
       if 'key_one' in $my_hash {
         notice('this will be printed')
       }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      **Deprecated:** Determine if a hash has a certain key value.

    @return
      Boolean value

    @example Example Usage:

      $my_hash = {'key_one' => 'value_one'}
      if has_key($my_hash, 'key_two') {
        notice('we will not reach here')
      }
      if has_key($my_hash, 'key_one') {
        notice('this will be printed')
      }

    > **Note:** **Deprecated** since Puppet 4.0.0, this can now be achieved in the Puppet
    language with the following equivalent expression:
    $my_hash = {'key_one' => 'value_one'}
    if 'key_one' in $my_hash {
      notice('this will be printed')
    }

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

    unless args.length == 2
      raise Puppet::ParseError, "has_key(): wrong number of arguments (#{args.length}; must be 2)"
    end
    unless args[0].is_a?(Hash)
      raise Puppet::ParseError, "has_key(): expects the first argument to be a hash, got #{args[0].inspect} which is of type #{args[0].class}"
    end
    args[0].key?(args[1])
  end
end
