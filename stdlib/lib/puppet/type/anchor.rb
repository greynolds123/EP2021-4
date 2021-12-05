Puppet::Type.newtype(:anchor) do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  desc <<-'DESCRIPTION'
  A simple resource type intended to be used as an anchor in a composite class.
=======
  desc <<-DOC
  @summary
    A simple resource type intended to be used as an anchor in a composite class.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
  desc <<-'DESCRIPTION'
  A simple resource type intended to be used as an anchor in a composite class.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
  desc <<-'DESCRIPTION'
  A simple resource type intended to be used as an anchor in a composite class.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
  desc <<-'DESCRIPTION'
  A simple resource type intended to be used as an anchor in a composite class.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

  In Puppet 2.6, when a class declares another class, the resources in the
  interior class are not contained by the exterior class. This interacts badly
  with the pattern of composing complex modules from smaller classes, as it
  makes it impossible for end users to specify order relationships between the
  exterior class and other modules.

  The anchor type lets you work around this. By sandwiching any interior
  classes between two no-op resources that _are_ contained by the exterior
  class, you can ensure that all resources in the module are contained.

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
      class ntp {
        # These classes will have the correct order relationship with each
        # other. However, without anchors, they won't have any order
        # relationship to Class['ntp'].
        class { 'ntp::package': }
        -> class { 'ntp::config': }
        -> class { 'ntp::service': }

        # These two resources "anchor" the composed classes within the ntp
        # class.
        anchor { 'ntp::begin': } -> Class['ntp::package']
        Class['ntp::service']    -> anchor { 'ntp::end': }
      }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  ```
  class ntp {
    # These classes will have the correct order relationship with each
    # other. However, without anchors, they won't have any order
    # relationship to Class['ntp'].
    class { 'ntp::package': }
    -> class { 'ntp::config': }
    -> class { 'ntp::service': }

    # These two resources "anchor" the composed classes within the ntp
    # class.
    anchor { 'ntp::begin': } -> Class['ntp::package']
    Class['ntp::service']    -> anchor { 'ntp::end': }
  }
  ```
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

  This allows the end user of the ntp module to establish require and before
  relationships with Class['ntp']:

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
      class { 'ntp': } -> class { 'mcollective': }
      class { 'mcollective': } -> class { 'ntp': }

  DESCRIPTION
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  ```
  class { 'ntp': } -> class { 'mcollective': }
  class { 'mcollective': } -> class { 'ntp': }
  ```

  DOC
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

  newparam :name do
    desc 'The name of the anchor resource.'
  end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======

>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======

>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  def refresh
    # We don't do anything with them, but we need this to
    #   show that we are "refresh aware" and not break the
    #   chain of propagation.
  end
end
