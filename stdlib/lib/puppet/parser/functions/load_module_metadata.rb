#
# load_module_metadata.rb
#
module Puppet::Parser::Functions
  newfunction(:load_module_metadata, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    This function loads the metadata of a given module.
=======
    @summary
      This function loads the metadata of a given module.

    @example Example USage:
      $metadata = load_module_metadata('archive')
      notify { $metadata['author']: }

    @return
      The modules metadata
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    This function loads the metadata of a given module.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    This function loads the metadata of a given module.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    This function loads the metadata of a given module.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  DOC
             ) do |args|
    raise(Puppet::ParseError, 'load_module_metadata(): Wrong number of arguments, expects one or two') unless [1, 2].include?(args.size)
    mod = args[0]
    allow_empty_metadata = args[1]
    module_path = function_get_module_path([mod])
    metadata_json = File.join(module_path, 'metadata.json')

    metadata_exists = File.exists?(metadata_json) # rubocop:disable Lint/DeprecatedClassMethods : Changing to .exist? breaks the code
    if metadata_exists
      metadata = PSON.load(File.read(metadata_json))
    else
      metadata = {}
      raise(Puppet::ParseError, "load_module_metadata(): No metadata.json file for module #{mod}") unless allow_empty_metadata
    end

    return metadata
  end
end
