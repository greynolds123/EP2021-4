<<<<<<< HEAD
#! /usr/bin/env ruby -S rspec
require 'spec_helper_acceptance'

describe 'get_module_path function', :unless => UNSUPPORTED_PLATFORMS.include?(fact('operatingsystem')) do
  describe 'success' do
    it 'get_module_paths dne' do
      pp = <<-EOS
=======
require 'spec_helper_acceptance'

describe 'get_module_path function' do
  describe 'success' do
    pp = <<-DOC
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
      $a = $::is_pe ? {
        'true'  => '/etc/puppetlabs/puppet/modules/dne',
        'false' => '/etc/puppet/modules/dne',
      }
      $o = get_module_path('dne')
      if $o == $a {
        notify { 'output correct': }
      } else {
        notify { "failed; module path is '$o'": }
      }
<<<<<<< HEAD
      EOS

=======
    DOC
    it 'get_module_paths dne' do
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
      apply_manifest(pp, :expect_failures => true)
    end
  end
  describe 'failure' do
    it 'handles improper argument counts'
    it 'handles non-numbers'
  end
end
