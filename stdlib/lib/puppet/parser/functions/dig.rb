#
# dig.rb
#
module Puppet::Parser::Functions
  newfunction(:dig, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    DEPRECATED: This function has been replaced in Puppet 4.5.0, please use dig44() for backwards compatibility or use the new version.
=======
    @summary
      **DEPRECATED** Retrieves a value within multiple layers of hashes and arrays via an
      array of keys containing a path.

    @return
      The function goes through the structure by each path component and tries to return
      the value at the end of the path.

    In addition to the required path argument, the function accepts the default argument.
    It is returned if the path is not correct, if no value was found, or if any other error
    has occurred.

      ```ruby
      $data = {
        'a' => {
          'b' => [
            'b1',
            'b2',
            'b3',
          ]
        }
      }

      $value = dig($data, ['a', 'b', 2])
      # $value = 'b3'

      # with all possible options
      $value = dig($data, ['a', 'b', 2], 'not_found')
      # $value = 'b3'

      # using the default value
      $value = dig($data, ['a', 'b', 'c', 'd'], 'not_found')
      # $value = 'not_found'
      ```

      1. `$data` The data structure we are working with.
      2. `['a', 'b', 2]` The path array.
      3. `not_found` The default value. It is returned if nothing is found.

    > **Note:*
      **Deprecated** This function has been replaced with a built-in
      [`dig`](https://puppet.com/docs/puppet/latest/function.html#dig) function as of
      Puppet 4.5.0. Use [`dig44()`](#dig44) for backwards compatibility or use the new version.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    DEPRECATED: This function has been replaced in Puppet 4.5.0, please use dig44() for backwards compatibility or use the new version.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    DEPRECATED: This function has been replaced in Puppet 4.5.0, please use dig44() for backwards compatibility or use the new version.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    DEPRECATED: This function has been replaced in Puppet 4.5.0, please use dig44() for backwards compatibility or use the new version.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    DEPRECATED: This function has been replaced in Puppet 4.5.0, please use dig44() for backwards compatibility or use the new version.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|
    warning('dig() DEPRECATED: This function has been replaced in Puppet 4.5.0, please use dig44() for backwards compatibility or use the new version.')
    unless Puppet::Parser::Functions.autoloader.loaded?(:dig44)
      Puppet::Parser::Functions.autoloader.load(:dig44)
    end
    function_dig44(arguments)
  end
end
