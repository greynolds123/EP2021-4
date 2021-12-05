<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# @summary
#   Returns the Extension (the Portion of Filename in Path starting from the
#   last Period).
=======
<<<<<<< HEAD
# Returns the Extension (the Portion of Filename in Path starting from the
# last Period).
=======
# @summary
#   Returns the Extension (the Portion of Filename in Path starting from the
#   last Period).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
# Returns the Extension (the Portion of Filename in Path starting from the
# last Period).
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
# Returns the Extension (the Portion of Filename in Path starting from the
# last Period).
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
#
# If Path is a Dotfile, or starts with a Period, then the starting Dot is not
# dealt with the Start of the Extension.
#
# An empty String will also be returned, when the Period is the last Character
# in Path.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD

=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======

>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
Puppet::Functions.create_function(:'stdlib::extname') do
  # @param filename The Filename
  # @return [String] The Extension starting from the last Period
  # @example Determining the Extension of a Filename
  #   stdlib::extname('test.rb')       => '.rb'
  #   stdlib::extname('a/b/d/test.rb') => '.rb'
  #   stdlib::extname('test')          => ''
  #   stdlib::extname('.profile')      => ''
  dispatch :extname do
    param 'String', :filename
    return_type 'String'
  end

  def extname(filename)
    File.extname(filename)
  end
end
