#
# loadyaml.rb
#
module Puppet::Parser::Functions
  newfunction(:loadyaml, :type => :rvalue, :arity => -2, :doc => <<-'DOC') do |args|
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Load a YAML file containing an array, string, or hash, and return the data
    in the corresponding native data type.
=======
    @summary
      Load a YAML file containing an array, string, or hash, and return the data
      in the corresponding native data type.

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Load a YAML file containing an array, string, or hash, and return the data
    in the corresponding native data type.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Load a YAML file containing an array, string, or hash, and return the data
    in the corresponding native data type.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Load a YAML file containing an array, string, or hash, and return the data
    in the corresponding native data type.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    The first parameter can be a file path or a URL.
    The second parameter is the default value. It will be returned if the file
    was not found or could not be parsed.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    For example:

=======
    @return [Array|String|Hash]
      The data stored in the YAML file, the type depending on the type of data that was stored.

    @example Example Usage:
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    For example:

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    For example:

>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    For example:

>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
        $myhash = loadyaml('/etc/puppet/data/myhash.yaml')
        $myhash = loadyaml('https://example.local/my_hash.yaml')
        $myhash = loadyaml('https://username:password@example.local/my_hash.yaml')
=======
    Load a YAML file containing an array, string, or hash, and return the data
    in the corresponding native data type.
    The second parameter is the default value. It will be returned if the file
    was not found or could not be parsed.

    For example:

        $myhash = loadyaml('/etc/puppet/data/myhash.yaml')
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        $myhash = loadyaml('no-file.yaml', {'default' => 'value'})
  DOC

    raise ArgumentError, 'Wrong number of arguments. 1 or 2 arguments should be provided.' unless args.length >= 1
    require 'yaml'
<<<<<<< HEAD
    require 'open-uri'
    begin
      if args[0].start_with?('http://', 'https://')
        username = ''
        password = ''
        if (match = args[0].match(%r{(http\://|https\://)(.*):(.*)@(.*)}))
          # If URL is in the format of https://username:password@example.local/my_hash.yaml
          protocol, username, password, path = match.captures
          url = "#{protocol}#{path}"
        elsif (match = args[0].match(%r{(http\:\/\/|https\:\/\/)(.*)@(.*)}))
          # If URL is in the format of https://username@example.local/my_hash.yaml
          protocol, username, path = match.captures
          url = "#{protocol}#{path}"
        else
          url = args[0]
        end
        begin
          contents = OpenURI.open_uri(url, :http_basic_authentication => [username, password])
        rescue OpenURI::HTTPError => err
          res = err.io
          warning("Can't load '#{url}' HTTP Error Code: '#{res.status[0]}'")
          args[1]
        end
        YAML.safe_load(contents) || args[1]
      elsif File.exists?(args[0]) # rubocop:disable Lint/DeprecatedClassMethods : Changing to .exist? breaks the code
        YAML.load_file(args[0]) || args[1]
      else
        warning("Can't load '#{args[0]}' File does not exist!")
=======

    if File.exists?(args[0]) # rubocop:disable Lint/DeprecatedClassMethods : Changing to .exist? breaks the code
      begin
        YAML.load_file(args[0]) || args[1]
      rescue StandardError => e
        raise e unless args[1]
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        args[1]
      end
    rescue StandardError => e
      raise e unless args[1]
      args[1]
    end
  end
end
