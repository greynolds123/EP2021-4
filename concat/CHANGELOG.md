<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##Supported Release 2.2.0
###Summary
=======
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
# Change log

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [v6.1.0](https://github.com/puppetlabs/puppetlabs-concat/tree/v6.1.0) (2019-07-23)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/v6.0.0...v6.1.0)

### Added

- FM-8049 - add redhat8 support [\#584](https://github.com/puppetlabs/puppetlabs-concat/pull/584) ([lionce](https://github.com/lionce))

### Fixed

- \(MODULES-9479\) Fix nested array merge behavior [\#593](https://github.com/puppetlabs/puppetlabs-concat/pull/593) ([seanmil](https://github.com/seanmil))
- \(FM-8317\) Updated regex to allow for windows paths with \'s [\#591](https://github.com/puppetlabs/puppetlabs-concat/pull/591) ([pgrant87](https://github.com/pgrant87))
- \(bugfix\) allow private keys in ssh testing [\#585](https://github.com/puppetlabs/puppetlabs-concat/pull/585) ([tphoney](https://github.com/tphoney))

## [v6.0.0](https://github.com/puppetlabs/puppetlabs-concat/tree/v6.0.0) (2019-05-21)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/5.3.0...v6.0.0)

### Changed

- pdksync - \(MODULES-8444\) - Raise lower Puppet bound [\#575](https://github.com/puppetlabs/puppetlabs-concat/pull/575) ([david22swan](https://github.com/david22swan))

### Added

- \(FM-7606\) enable litmus for concat [\#577](https://github.com/puppetlabs/puppetlabs-concat/pull/577) ([tphoney](https://github.com/tphoney))

### Fixed

- \(FM-8073\) litmus block support [\#580](https://github.com/puppetlabs/puppetlabs-concat/pull/580) ([tphoney](https://github.com/tphoney))

## [5.3.0](https://github.com/puppetlabs/puppetlabs-concat/tree/5.3.0) (2019-02-20)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/5.2.0...5.3.0)

### Added

- \(MODULES-8138\) - Addition of support for SLES 15 [\#545](https://github.com/puppetlabs/puppetlabs-concat/pull/545) ([david22swan](https://github.com/david22swan))

### Fixed

- \(FM-7725\) - Remove OSX testing/support for concat [\#561](https://github.com/puppetlabs/puppetlabs-concat/pull/561) ([lionce](https://github.com/lionce))
- pdksync - \(FM-7655\) Fix rubygems-update for ruby \< 2.3 [\#550](https://github.com/puppetlabs/puppetlabs-concat/pull/550) ([tphoney](https://github.com/tphoney))

## [5.2.0](https://github.com/puppetlabs/puppetlabs-concat/tree/5.2.0) (2018-12-10)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/5.1.0...5.2.0)

### Added

- \(FM-7339\) - Add i18n implementation [\#537](https://github.com/puppetlabs/puppetlabs-concat/pull/537) ([eimlav](https://github.com/eimlav))
- \(FM-7341\) - Added REFERENCE.md and updated documentation [\#536](https://github.com/puppetlabs/puppetlabs-concat/pull/536) ([eimlav](https://github.com/eimlav))
- \(MODULES-5124\) Add support for JSON arrays [\#519](https://github.com/puppetlabs/puppetlabs-concat/pull/519) ([johanfleury](https://github.com/johanfleury))

### Fixed

- \(FM-7581\) - Fix CI failures for Windows 2016 and 10 Enterprise [\#540](https://github.com/puppetlabs/puppetlabs-concat/pull/540) ([eimlav](https://github.com/eimlav))
- \(MODULES-8287\) - Fix fomat=\>'yaml' allowing only hashes [\#535](https://github.com/puppetlabs/puppetlabs-concat/pull/535) ([eimlav](https://github.com/eimlav))
-  \(FM-7513\) - Removing Windows 2016-core from our support matrix  [\#534](https://github.com/puppetlabs/puppetlabs-concat/pull/534) ([pmcmaw](https://github.com/pmcmaw))
- \(MODULES-8088\) - newline\_spec.rb test expectation update [\#531](https://github.com/puppetlabs/puppetlabs-concat/pull/531) ([lionce](https://github.com/lionce))
- \(MODULES-7717\) ensure\_newline uses unix line ending on windows [\#517](https://github.com/puppetlabs/puppetlabs-concat/pull/517) ([tkishel](https://github.com/tkishel))

## [5.1.0](https://github.com/puppetlabs/puppetlabs-concat/tree/5.1.0) (2018-10-03)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/5.0.0...5.1.0)

### Added

- pdksync - \(FM-7392\) - Puppet 6 Testing Changes [\#525](https://github.com/puppetlabs/puppetlabs-concat/pull/525) ([pmcmaw](https://github.com/pmcmaw))
- pdksync - \(MODULES-6805\) metadata.json shows support for puppet 6 [\#524](https://github.com/puppetlabs/puppetlabs-concat/pull/524) ([tphoney](https://github.com/tphoney))
- pdksync - \(MODULES-7658\) use beaker4 in puppet-module-gems [\#518](https://github.com/puppetlabs/puppetlabs-concat/pull/518) ([tphoney](https://github.com/tphoney))

## [5.0.0](https://github.com/puppetlabs/puppetlabs-concat/tree/5.0.0) (2018-08-24)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/4.2.1...5.0.0)

### Changed

- \[FM-6954\] Removal of scientific linux 5 and debian 7 [\#508](https://github.com/puppetlabs/puppetlabs-concat/pull/508) ([david22swan](https://github.com/david22swan))

### Added

- \(FM-7206\) Update concat to support Ubuntu 18.04 [\#510](https://github.com/puppetlabs/puppetlabs-concat/pull/510) ([david22swan](https://github.com/david22swan))

### Fixed

- Handle concat\_file source when not an array [\#493](https://github.com/puppetlabs/puppetlabs-concat/pull/493) ([vicinus](https://github.com/vicinus))

## 4.2.1

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/4.2.0...4.2.1)

### Fixed
- \(MODULES-6817\) noop =\> false for concat\_file [\#492](https://github.com/puppetlabs/puppetlabs-concat/pull/492) ([hunner](https://github.com/hunner))

## Supported Release 4.2.0
### Summary
This release introduces the conversion of the module to use PDK 1.3.2, along with the addition of rubocop with associated fixes.

#### Changed
- All changes in this release are for enabling rubocop, alongside the module then being converted over to the PDK.


## Supported Releases 4.1.1
### Summary
This release is to update the formatting of the module, rubocop having been run for all ruby files and been set to run automatically on all future commits.

#### Changed
- Rubocop has been implemented.
- SLES 10, Windows 2003 R2 and OSX 10.9 removed as supported.
- OSX 10.10 and 10.11 added as supported.

## Supported Releases 4.1.0
### Summary

This release is a rollup of changes. The most notable change being the addition of the 'format' attribute which allows output in JSON and YAML formats, and the 'force' attribute which if true forces a merge of duplicate keys for these formats.

#### Features
- Format and force attributes added.
- Deprecated is_string in favour of puppet language.
- End of Life Ubuntu releases removed as supported.
- Debian 9 added and Debian 6 removed as supported.

#### Bugfixes
- (MODULES-4359) Fix native types so they can be used directly.
- Update to tests to handle errors containing quote marks.
- Update to tests to follow rspec-puppet pattern.

## Supported Releases 4.0.1
### Summary

This is a small release that updates regex in a test due to changes made in Puppet.

#### Bugfixes

- (MODULES-5085) Ensure that replace test handles qoutes in change message

## Supported Releases 3.0.0 & 4.0.0
### Summary

This double release adds new Puppet 4 data types. The 3.0.0 release is fully backwards compatible to 
existing Puppet 4 configurations and provides you with [deprecation warnings](https://github.com/puppetlabs/puppetlabs-stdlib#deprecation) for every argument that 
will not work as expected with the final 4.0.0 release. See the [stdlib docs](https://github.com/puppetlabs/puppetlabs-stdlib#validate_legacy) for an in-depth discussion of this.

If you're still running Puppet 3, remain on the latest puppetlabs-concat 2.x release for now, and see the documentation to [upgrade to Puppet 4](https://docs.puppet.com/puppet/4.6/reference/upgrade_major_pre.html).

#### Added
- puppet-strings documentation
- Puppet 4 data types and deprecation warnings

#### Changed
- stdlib dependency changed to 4.13.1
- supported Puppet version changed to 4.7.

## Supported Release 2.2.1
### Summary

This is a backwards compatible bugfix release.

#### Bugfixes

- (MODULES-4350) Makes :path the namevar for concat_file
- (MODULES-4351) Prevents the :order parameter from accepting arbitrary values in concat_file
- (MODULES-4352) Restricts the :replace parameter to values accepted by file
- (MODULES-4474) Drops auto requirement of fragments
- (MODULES-3900) Improves error messages in concat::fragment
- Uses the whole fragment title when sorting

## Supported Release 2.2.0
### Summary
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

This release includes support for Debian 8 and Ubuntu 16.04 in addition to numerous bugfixes.

#### Features
- Adds Debian 8 support
- Adds Ubuntu 16.04 support

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
####Bugfixes
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
# Change log

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [v6.1.0](https://github.com/puppetlabs/puppetlabs-concat/tree/v6.1.0) (2019-07-23)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/v6.0.0...v6.1.0)

### Added

- FM-8049 - add redhat8 support [\#584](https://github.com/puppetlabs/puppetlabs-concat/pull/584) ([lionce](https://github.com/lionce))

### Fixed

- \(MODULES-9479\) Fix nested array merge behavior [\#593](https://github.com/puppetlabs/puppetlabs-concat/pull/593) ([seanmil](https://github.com/seanmil))
- \(FM-8317\) Updated regex to allow for windows paths with \'s [\#591](https://github.com/puppetlabs/puppetlabs-concat/pull/591) ([pgrant87](https://github.com/pgrant87))
- \(bugfix\) allow private keys in ssh testing [\#585](https://github.com/puppetlabs/puppetlabs-concat/pull/585) ([tphoney](https://github.com/tphoney))

## [v6.0.0](https://github.com/puppetlabs/puppetlabs-concat/tree/v6.0.0) (2019-05-21)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/5.3.0...v6.0.0)

### Changed

- pdksync - \(MODULES-8444\) - Raise lower Puppet bound [\#575](https://github.com/puppetlabs/puppetlabs-concat/pull/575) ([david22swan](https://github.com/david22swan))

### Added

- \(FM-7606\) enable litmus for concat [\#577](https://github.com/puppetlabs/puppetlabs-concat/pull/577) ([tphoney](https://github.com/tphoney))

### Fixed

- \(FM-8073\) litmus block support [\#580](https://github.com/puppetlabs/puppetlabs-concat/pull/580) ([tphoney](https://github.com/tphoney))

## [5.3.0](https://github.com/puppetlabs/puppetlabs-concat/tree/5.3.0) (2019-02-20)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/5.2.0...5.3.0)

### Added

- \(MODULES-8138\) - Addition of support for SLES 15 [\#545](https://github.com/puppetlabs/puppetlabs-concat/pull/545) ([david22swan](https://github.com/david22swan))

### Fixed

- \(FM-7725\) - Remove OSX testing/support for concat [\#561](https://github.com/puppetlabs/puppetlabs-concat/pull/561) ([lionce](https://github.com/lionce))
- pdksync - \(FM-7655\) Fix rubygems-update for ruby \< 2.3 [\#550](https://github.com/puppetlabs/puppetlabs-concat/pull/550) ([tphoney](https://github.com/tphoney))

## [5.2.0](https://github.com/puppetlabs/puppetlabs-concat/tree/5.2.0) (2018-12-10)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/5.1.0...5.2.0)

### Added

- \(FM-7339\) - Add i18n implementation [\#537](https://github.com/puppetlabs/puppetlabs-concat/pull/537) ([eimlav](https://github.com/eimlav))
- \(FM-7341\) - Added REFERENCE.md and updated documentation [\#536](https://github.com/puppetlabs/puppetlabs-concat/pull/536) ([eimlav](https://github.com/eimlav))
- \(MODULES-5124\) Add support for JSON arrays [\#519](https://github.com/puppetlabs/puppetlabs-concat/pull/519) ([johanfleury](https://github.com/johanfleury))

### Fixed

- \(FM-7581\) - Fix CI failures for Windows 2016 and 10 Enterprise [\#540](https://github.com/puppetlabs/puppetlabs-concat/pull/540) ([eimlav](https://github.com/eimlav))
- \(MODULES-8287\) - Fix fomat=\>'yaml' allowing only hashes [\#535](https://github.com/puppetlabs/puppetlabs-concat/pull/535) ([eimlav](https://github.com/eimlav))
-  \(FM-7513\) - Removing Windows 2016-core from our support matrix  [\#534](https://github.com/puppetlabs/puppetlabs-concat/pull/534) ([pmcmaw](https://github.com/pmcmaw))
- \(MODULES-8088\) - newline\_spec.rb test expectation update [\#531](https://github.com/puppetlabs/puppetlabs-concat/pull/531) ([lionce](https://github.com/lionce))
- \(MODULES-7717\) ensure\_newline uses unix line ending on windows [\#517](https://github.com/puppetlabs/puppetlabs-concat/pull/517) ([tkishel](https://github.com/tkishel))

## [5.1.0](https://github.com/puppetlabs/puppetlabs-concat/tree/5.1.0) (2018-10-03)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/5.0.0...5.1.0)

### Added

- pdksync - \(FM-7392\) - Puppet 6 Testing Changes [\#525](https://github.com/puppetlabs/puppetlabs-concat/pull/525) ([pmcmaw](https://github.com/pmcmaw))
- pdksync - \(MODULES-6805\) metadata.json shows support for puppet 6 [\#524](https://github.com/puppetlabs/puppetlabs-concat/pull/524) ([tphoney](https://github.com/tphoney))
- pdksync - \(MODULES-7658\) use beaker4 in puppet-module-gems [\#518](https://github.com/puppetlabs/puppetlabs-concat/pull/518) ([tphoney](https://github.com/tphoney))

## [5.0.0](https://github.com/puppetlabs/puppetlabs-concat/tree/5.0.0) (2018-08-24)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/4.2.1...5.0.0)

### Changed

- \[FM-6954\] Removal of scientific linux 5 and debian 7 [\#508](https://github.com/puppetlabs/puppetlabs-concat/pull/508) ([david22swan](https://github.com/david22swan))

### Added

- \(FM-7206\) Update concat to support Ubuntu 18.04 [\#510](https://github.com/puppetlabs/puppetlabs-concat/pull/510) ([david22swan](https://github.com/david22swan))

### Fixed

- Handle concat\_file source when not an array [\#493](https://github.com/puppetlabs/puppetlabs-concat/pull/493) ([vicinus](https://github.com/vicinus))

## 4.2.1

[Full Changelog](https://github.com/puppetlabs/puppetlabs-concat/compare/4.2.0...4.2.1)

### Fixed
- \(MODULES-6817\) noop =\> false for concat\_file [\#492](https://github.com/puppetlabs/puppetlabs-concat/pull/492) ([hunner](https://github.com/hunner))

## Supported Release 4.2.0
### Summary
This release introduces the conversion of the module to use PDK 1.3.2, along with the addition of rubocop with associated fixes.

#### Changed
- All changes in this release are for enabling rubocop, alongside the module then being converted over to the PDK.


## Supported Releases 4.1.1
### Summary
This release is to update the formatting of the module, rubocop having been run for all ruby files and been set to run automatically on all future commits.

#### Changed
- Rubocop has been implemented.
- SLES 10, Windows 2003 R2 and OSX 10.9 removed as supported.
- OSX 10.10 and 10.11 added as supported.

## Supported Releases 4.1.0
### Summary

This release is a rollup of changes. The most notable change being the addition of the 'format' attribute which allows output in JSON and YAML formats, and the 'force' attribute which if true forces a merge of duplicate keys for these formats.

#### Features
- Format and force attributes added.
- Deprecated is_string in favour of puppet language.
- End of Life Ubuntu releases removed as supported.
- Debian 9 added and Debian 6 removed as supported.

#### Bugfixes
- (MODULES-4359) Fix native types so they can be used directly.
- Update to tests to handle errors containing quote marks.
- Update to tests to follow rspec-puppet pattern.

## Supported Releases 4.0.1
### Summary

This is a small release that updates regex in a test due to changes made in Puppet.

#### Bugfixes

- (MODULES-5085) Ensure that replace test handles qoutes in change message

## Supported Releases 3.0.0 & 4.0.0
### Summary

This double release adds new Puppet 4 data types. The 3.0.0 release is fully backwards compatible to 
existing Puppet 4 configurations and provides you with [deprecation warnings](https://github.com/puppetlabs/puppetlabs-stdlib#deprecation) for every argument that 
will not work as expected with the final 4.0.0 release. See the [stdlib docs](https://github.com/puppetlabs/puppetlabs-stdlib#validate_legacy) for an in-depth discussion of this.

If you're still running Puppet 3, remain on the latest puppetlabs-concat 2.x release for now, and see the documentation to [upgrade to Puppet 4](https://docs.puppet.com/puppet/4.6/reference/upgrade_major_pre.html).

#### Added
- puppet-strings documentation
- Puppet 4 data types and deprecation warnings

#### Changed
- stdlib dependency changed to 4.13.1
- supported Puppet version changed to 4.7.

## Supported Release 2.2.1
### Summary

This is a backwards compatible bugfix release.

#### Bugfixes

- (MODULES-4350) Makes :path the namevar for concat_file
- (MODULES-4351) Prevents the :order parameter from accepting arbitrary values in concat_file
- (MODULES-4352) Restricts the :replace parameter to values accepted by file
- (MODULES-4474) Drops auto requirement of fragments
- (MODULES-3900) Improves error messages in concat::fragment
- Uses the whole fragment title when sorting

## Supported Release 2.2.0
### Summary

This release includes support for Debian 8 and Ubuntu 16.04 in addition to numerous bugfixes.

#### Features
- Adds Debian 8 support
- Adds Ubuntu 16.04 support

=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### Bugfixes
- Fixes the stdlib lower dependency.
- (MODULES-3027) Fixes escaping the '*' character in tag creation.
- (MODULES-3097) Fixes fragment sorting by alpha
- Correctly propagates 'validate_cmd' parameter to generated file resource
- Correctly escapes disallowed characters in fragment tag creation
- (MODULES-3332) Correct the target path validation
- (MODULES-3463) Properly passes metaparams to generated resource

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##Supported Release 2.1.0
###Summary

This is a re-release of concat as a resource type. This release also includes new features and bugfixes on top of the previously YANKED 2.0.1 release.

####Features
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
## Supported Release 2.1.0
### Summary

This is a re-release of concat as a resource type. This release also includes new features and bugfixes on top of the previously YANKED 2.0.1 release.

=======
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## Supported Release 2.1.0
### Summary

This is a re-release of concat as a resource type. This release also includes new features and bugfixes on top of the previously YANKED 2.0.1 release.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### Features
- Adds the show_diff property.
- Adds the selinux related file params.
- Allows integer UID/GID values to be passed into `$owner` and `$group`

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
####Bugfixes
=======
#### Bugfixes
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
- Adds a workaround to PUP-1963: generated resources never receiving dependency edges.
- Fixes occassional failure to find directory environment.

## Supported Release 1.2.5
### Summary

Small release for support of newer PE versions. This increments the version of PE in the metadata.json file.

## 2015-07-21 - Supported Release 1.2.4
### Summary

This release includes some ruby path and lint fixes.

<<<<<<< HEAD
####Bugfixes
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### Bugfixes
- Adds a workaround to PUP-1963: generated resources never receiving dependency edges.
- Fixes occassional failure to find directory environment.

## Supported Release 1.2.5
### Summary

Small release for support of newer PE versions. This increments the version of PE in the metadata.json file.

## 2015-07-21 - Supported Release 1.2.4
### Summary

This release includes some ruby path and lint fixes.

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
#### Bugfixes
- Use correct ruby path with PE and AIO
- Lint fixes
- Use correct ruby path on FreeBSD
- Test fixes

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##2015-06-02 - Supported Release 2.0.1 [YANKED]
###Summary

This is a bugfix release. 

####Bugfixes
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
## 2015-06-02 - Supported Release 2.0.1 [YANKED]
### Summary

This is a bugfix release. 

=======
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## 2015-06-02 - Supported Release 2.0.1 [YANKED]
### Summary

This is a bugfix release. 

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### Bugfixes
- Fixes dependency graphing with concurrent modification of the same file.
- Fixes handling fragment target.
- Fixes the defaulted force behavior to handle empty concats correctly.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##2015-06-02 - Supported Release 1.2.3
###Summary
=======
## 2015-06-02 - Supported Release 1.2.3
### Summary
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed

This release includes a README fix to document correct behavior of fragment target parameter.

#### Bugfixes
- README Fix to correctly document how a fragment $target param should work.

## 2015-05-12 - Supported Release 2.0.0 [YANKED]
### Summary

This is a major release. Includes re-implementation of concat to use native Type and Providers, resulting in significantly improved performance and testability. Also includes a bugfix to alpha ordering of fragments.

#### Features
- Re-implementation of concat to use native Type and Providers.

#### Bugfixes
- Fixes a bug in alpha ordering of fragments.

## 2015-05-12 - Supported Release 1.2.2
### Summary

This release includes a bugfix.

#### Bugfixes
- Fixes a bug introduced by MODULES-1700, in handling default retrieval of fragment backup parameter.

## 2015-04-14 - Supported Release 1.2.1
### Summary

This release includes bugfixes, test improvements, and a rewritten README.

<<<<<<< HEAD
####Bugfixes
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## 2015-06-02 - Supported Release 1.2.3
### Summary

This release includes a README fix to document correct behavior of fragment target parameter.

#### Bugfixes
- README Fix to correctly document how a fragment $target param should work.

## 2015-05-12 - Supported Release 2.0.0 [YANKED]
### Summary

This is a major release. Includes re-implementation of concat to use native Type and Providers, resulting in significantly improved performance and testability. Also includes a bugfix to alpha ordering of fragments.

#### Features
- Re-implementation of concat to use native Type and Providers.

#### Bugfixes
- Fixes a bug in alpha ordering of fragments.

## 2015-05-12 - Supported Release 1.2.2
### Summary

This release includes a bugfix.

#### Bugfixes
- Fixes a bug introduced by MODULES-1700, in handling default retrieval of fragment backup parameter.

## 2015-04-14 - Supported Release 1.2.1
### Summary

This release includes bugfixes, test improvements, and a rewritten README.

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
#### Bugfixes

- Verifies existence of $is_pe before using it.
- Adds validation for $order param to not allow restricted characters.
- Sets the group id on Fragments for versions of Facter that contain the $gid fact.
- Sets the script group to 0 if the script is owned by root.
- Explicitly sets script and concat directories to the same owner and group.
- Re-adds support for fragment backup, so that static compiler can work with filebucket (MODULES-1700).

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##2015-02-17 - Supported Release 1.2.0
###Summary
=======
## 2015-02-17 - Supported Release 1.2.0
### Summary
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed

This release includes a number of bugfixes and adds support for running a validation command when using puppet >= 3.5.0.

#### Features
- Support running a validation command for Puppet >= 3.5.0

<<<<<<< HEAD
####Bugfixes
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## 2015-02-17 - Supported Release 1.2.0
### Summary

This release includes a number of bugfixes and adds support for running a validation command when using puppet >= 3.5.0.

#### Features
- Support running a validation command for Puppet >= 3.5.0

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
#### Bugfixes
- Reset poisoned defaults from Exec
- Use concatfragments.rb on AIX since it doesn't support print0
- Make sure ruby is in the path for PE (MODULES-1456)
- Fix missing method for check_is_owned_by for windows (MODULES-1764)
- Fix sort by numeric

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##2014-10-28 - Supported Release 1.1.2
###Summary

This release includes bugfixes and test improvements. The module was tested against SLES10 and SLES12 and found to work against those platforms with no module improvements. Metadata was updated to include those as supported platforms.

####Bugfixes
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
## 2014-10-28 - Supported Release 1.1.2
### Summary

This release includes bugfixes and test improvements. The module was tested against SLES10 and SLES12 and found to work against those platforms with no module improvements. Metadata was updated to include those as supported platforms.

=======
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## 2014-10-28 - Supported Release 1.1.2
### Summary

This release includes bugfixes and test improvements. The module was tested against SLES10 and SLES12 and found to work against those platforms with no module improvements. Metadata was updated to include those as supported platforms.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### Bugfixes
- newline didn't work for Windows and Solaris. This has been fixed.
- Install certs on Windows for acceptance tests
- Update tests to work with strict variables (no module updates were required)
- Update tests to work on Windows
- Fix typo in CHANGELOG.md

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##2014-09-10 - Supported Release 1.1.1
###Summary

This is a bugfix release, and the first supported release of the 1.1.x series.

####Bugfixes
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## 2014-09-10 - Supported Release 1.1.1
### Summary

This is a bugfix release, and the first supported release of the 1.1.x series.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
## 2014-09-10 - Supported Release 1.1.1
### Summary

This is a bugfix release, and the first supported release of the 1.1.x series.

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### Bugfixes
- Make the `$order` parameter default to a string and be validated as an integer
  or a string
- Use the ruby script on Solaris to not break Sol10 support
- Add quotes to the ruby script location for Windows
- Fix typos in README.md
- Make regex in concat::setup case-insensitive to make it work on Windows
- Make sure concat fragments are always replaced
- Fix validation to allow `$backup` to be a boolean
- Remove dependency on stdlib 4.x
- Fix for lack of idempotency with `ensure => 'absent'`
- Fix tests and spec_helper
- Synchronized files for more consistency across modules via modulesync

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##2014-05-14 - Release 1.1.0
###Summary
=======
## 2014-05-14 - Release 1.1.0
### Summary
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed

This release is primarily a bugfix release since 1.1.0-rc1.

#### Features
- Improved testing, with tests moved to beaker

<<<<<<< HEAD
####Bugfixes
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## 2014-05-14 - Release 1.1.0
### Summary

This release is primarily a bugfix release since 1.1.0-rc1.

#### Features
- Improved testing, with tests moved to beaker

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
#### Bugfixes
- No longer attempts to set fragment owner and mode on Windows
- Fix numeric sorting
- Fix incorrect quoting
- Fix newlines

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##2014-01-03 - Release 1.1.0-rc1
###Summary
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## 2014-01-03 - Release 1.1.0-rc1
### Summary

This release of concat was 90% written by Joshua Hoblitt, and the module team
would like to thank him for the huge amount of work he put into this release.

This module deprecates a bunch of old parameters and usage patterns, modernizes
much of the manifest code, simplifies a whole bunch of logic and makes
improvements to almost all parts of the module.

The other major feature is windows support, courtesy of luisfdez, with an
alternative version of the concat bash script in ruby.  We've attempted to
ensure that there are no backwards incompatible changes, all users of 1.0.0
should be able to use 1.1.0 without any failures, but you may find deprecation
warnings and we'll be aggressively moving for a 2.0 to remove those too.

For further information on deprecations, please read:
https://github.com/puppetlabs/puppetlabs-concat/blob/master/README.md#api-deprecations

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
####Removed
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### Removed
- Puppet 0.24 support.
- Filebucket backup of all file resources except the target concatenated file.
- Default owner/user/group values.
- Purging of long unused /usr/local/bin/concatfragments.sh

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
###Features
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
### Features
- Windows support via a ruby version of the concat bash script.
- Huge amount of acceptance testing work added.
- Documentation (README) completely rewritten.
- New parameters in concat:
 - `ensure`: Controls if the file should be present/absent at all.
 - Remove requirement to include concat::setup in manifests.
 - Made `gnu` parameter deprecated.
 - Added parameter validation.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
###Bugfixes
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
### Bugfixes
 - Ensure concat::setup runs before concat::fragment in all cases.
 - Pluginsync references updated for modern Puppet.
 - Fix incorrect group parameter.
 - Use $owner instead of $id to avoid confusion with $::id
 - Compatibility fixes for Puppet 2.7/ruby 1.8.7
 - Use LC_ALL=C instead of LANG=C
 - Always exec the concatfragments script as root when running as root.
 - Syntax and other cleanup changes.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##2014-06-25 - Supported Release 1.0.4
###Summary
=======
## 2014-06-25 - Supported Release 1.0.4
### Summary
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed

This release has test fixes.

#### Features
- Added test support for OSX.

#### Bugfixes

#### Known bugs

* Not supported on Windows.

## 2014-06-04 - Release 1.0.3
### Summary

This release adds compatibility for PE3.3 and fixes tests.

#### Features
- Added test support for Ubuntu Trusty.

#### Bugfixes

#### Known bugs

*Not supported on Windows.

## 2014-03-04 - Supported Release 1.0.2
### Summary

This is a supported release. No functional changes were made from 1.0.1.

#### Features
- Huge amount of tests backported from 1.1.
- Documentation rewrite.

#### Bugfixes

<<<<<<< HEAD
####Known Bugs
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## 2014-06-25 - Supported Release 1.0.4
### Summary

This release has test fixes.

#### Features
- Added test support for OSX.

#### Bugfixes

#### Known bugs

* Not supported on Windows.

## 2014-06-04 - Release 1.0.3
### Summary

This release adds compatibility for PE3.3 and fixes tests.

#### Features
- Added test support for Ubuntu Trusty.

#### Bugfixes

#### Known bugs

*Not supported on Windows.

## 2014-03-04 - Supported Release 1.0.2
### Summary

This is a supported release. No functional changes were made from 1.0.1.

#### Features
- Huge amount of tests backported from 1.1.
- Documentation rewrite.

#### Bugfixes

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
#### Known Bugs

* Not supported on Windows.


<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##2014-02-12 - 1.0.1
###Summary

Minor bugfixes for sorting of fragments and ordering of resources.

####Bugfixes
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
## 2014-02-12 - 1.0.1
### Summary

Minor bugfixes for sorting of fragments and ordering of resources.

=======
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## 2014-02-12 - 1.0.1
### Summary

Minor bugfixes for sorting of fragments and ordering of resources.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### Bugfixes
- LANG => C replaced with LC_ALL => C to reduce spurious recreation of
fragments.
- Corrected pluginsync documentation.
- Ensure concat::setup always runs before fragments.


<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
##2013-08-09 - 1.0.0
###Summary
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
## 2013-08-09 - 1.0.0
### Summary

Many new features and bugfixes in this release, and if you're a heavy concat
user you should test carefully before upgrading.  The features should all be
backwards compatible but only light testing has been done from our side before
this release.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
####Features
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### Features
- New parameters in concat:
 - `replace`: specify if concat should replace existing files.
 - `ensure_newline`: controls if fragments should contain a newline at the end.
- Improved README documentation.
- Add rspec:system tests (rake spec:system to test concat)

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
####Bugfixes
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### Bugfixes
- Gracefully handle \n in a fragment resource name.
- Adding more helpful message for 'pluginsync = true'
- Allow passing `source` and `content` directly to file resource, rather than
defining resource defaults.
- Added -r flag to read so that filenames with \ will be read correctly.
- sort always uses LANG=C.
- Allow WARNMSG to contain/start with '#'.
- Replace while-read pattern with for-do in order to support Solaris.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
####CHANGELOG:
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#### CHANGELOG:
- 2010/02/19 - initial release
- 2010/03/12 - add support for 0.24.8 and newer
             - make the location of sort configurable
             - add the ability to add shell comment based warnings to
               top of files
             - add the ablity to create empty files
- 2010/04/05 - fix parsing of WARN and change code style to match rest
               of the code
             - Better and safer boolean handling for warn and force
             - Don't use hard coded paths in the shell script, set PATH
               top of the script
             - Use file{} to copy the result and make all fragments owned
               by root.  This means we can chnage the ownership/group of the
               resulting file at any time.
             - You can specify ensure => "/some/other/file" in concat::fragment
               to include the contents of a symlink into the final file.
- 2010/04/16 - Add more cleaning of the fragment name - removing / from the $name
- 2010/05/22 - Improve documentation and show the use of ensure =>
- 2010/07/14 - Add support for setting the filebucket behavior of files
- 2010/10/04 - Make the warning message configurable
- 2010/12/03 - Add flags to make concat work better on Solaris - thanks Jonathan Boyett
- 2011/02/03 - Make the shell script more portable and add a config option for root group
- 2011/06/21 - Make base dir root readable only for security
- 2011/06/23 - Set base directory using a fact instead of hardcoding it
- 2011/06/23 - Support operating as non privileged user
- 2011/06/23 - Support dash instead of bash or sh
- 2011/07/11 - Better solaris support
- 2011/12/05 - Use fully qualified variables
- 2011/12/13 - Improve Nexenta support
- 2012/04/11 - Do not use any GNU specific extensions in the shell script
- 2012/03/24 - Comply to community style guides
- 2012/05/23 - Better errors when basedir isnt set
- 2012/05/31 - Add spec tests
- 2012/07/11 - Include concat::setup in concat improving UX
- 2012/08/14 - Puppet Lint improvements
- 2012/08/30 - The target path can be different from the $name
- 2012/08/30 - More Puppet Lint cleanup
- 2012/09/04 - RELEASE 0.2.0
- 2012/12/12 - Added (file) $replace parameter to concat


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
