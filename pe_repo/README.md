pe_repo
<<<<<<< HEAD

=======
==========
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
This is the pe_repo module.

This is meant to help you create a repo of PE packages on a master of your choice, making it easy to deploy agents via packages exclusively.

It works by mirroring using the staging module to copy and unpack the build specific versions of the pe installer, and reshares that build's packages folders using the PE master's pe-httpd instance.

It then generates a site specific series of commands you can use to:
Add the repository for that distribution to the os's package provider
List of packages to be installed (hopefully soon replaced with pe-agent metapackage)
How to start the service

If you want, these commands can be piped into /bin/bash directly to execute the installation steps, however this is running arbitrary shell code you downloaded over the internet, so know your dealer.

Usage:
<<<<<<< HEAD

=======
-----
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
The module provides generic defines for creating repos for deb and el platforms with configurable versions. It also includes classes for each supported platform, installing the same version as the master, which can be used to select repos from the console.

```puppet
include pe_repo

include pe_repo::platform::debian_7_amd64

pe_repo::el { 'el-6-i386':
  pe_version => '3.2.0',
}
```
<<<<<<< HEAD

Specs
-----

To run the specs first setup your local gems with:

```sh
bundle install
```

and then:

```sh
bundle exec rake spec
```

To bypass creation of fixture modules with each run:

```sh
bundle exec rake spec_prep
```

and then:


```sh
bundle exec rake spec_standalone
```

License
-------


Contact
-------

=======
Testing
-------

Please see the testing information in the top level [README](../../README.md) on how to use Frankenbuilder and RSpec on your changes.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

Support
-------

<<<<<<< HEAD
Please log tickets and issues at our [Projects site](http://projects.example.com)
=======
Tickets: https://tickets.puppetlabs.com/browse/PE. Make sure to set component to 'PE Modules'.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
