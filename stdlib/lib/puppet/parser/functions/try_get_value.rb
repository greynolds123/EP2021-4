#
# try_get_value.rb
#
module Puppet::Parser::Functions
  newfunction(
    :try_get_value,
    :type => :rvalue,
    :arity => -2,
    :doc => <<-DOC
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
      DEPRECATED: this function is deprecated, please use dig() instead.

      Looks up into a complex structure of arrays and hashes and returns a value
      or the default value if nothing was found.

      Key can contain slashes to describe path components. The function will go down
      the structure and try to extract the required value.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
      @summary
        **DEPRECATED:** this function is deprecated, please use dig() instead.

      @return
        Looks up into a complex structure of arrays and hashes and returns a value
        or the default value if nothing was found.

      Key can contain slashes to describe path components. The function will go down
      the structure and try to extract the required value.
      ``
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
      $data = {
        'a' => {
          'b' => [
            'b1',
            'b2',
            'b3',
          ]
        }
      }

      $value = try_get_value($data, 'a/b/2', 'not_found', '/')
      => $value = 'b3'
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

=======
      ```
      ```
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======

>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======

>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
      a -> first hash key
      b -> second hash key
      2 -> array index starting with 0

      not_found -> (optional) will be returned if there is no value or the path did not match. Defaults to nil.
      / -> (optional) path delimiter. Defaults to '/'.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
      ```
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

      In addition to the required "key" argument, "try_get_value" accepts default
      argument. It will be returned if no value was found or a path component is
      missing. And the fourth argument can set a variable path separator.
    DOC
  ) do |args|
    warning('try_get_value() DEPRECATED: this function is deprecated, please use dig() instead.')
    data = args[0]
    path = args[1] || ''
    default = args[2]

    if !(data.is_a?(Hash) || data.is_a?(Array)) || path == ''
      return default || data
    end

    separator = args[3] || '/'
    path = path.split(separator).map { |key| (key =~ %r{^\d+$}) ? key.to_i : key }
    function_dig([data, path, default])
  end
end
