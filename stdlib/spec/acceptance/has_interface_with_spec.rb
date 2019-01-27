<<<<<<< HEAD
#! /usr/bin/env ruby -S rspec
require 'spec_helper_acceptance'

describe 'has_interface_with function', :unless => ((UNSUPPORTED_PLATFORMS.include?(fact('operatingsystem'))) or (fact('osfamily') == 'windows') or (fact('osfamily') == 'AIX')) do
  describe 'success' do
    it 'has_interface_with existing ipaddress' do
      pp = <<-EOS
      $a = $::ipaddress
      $o = has_interface_with('ipaddress', $a)
      notice(inline_template('has_interface_with is <%= @o.inspect %>'))
      EOS

      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(/has_interface_with is true/)
      end
    end
    it 'has_interface_with absent ipaddress' do
      pp = <<-EOS
      $a = '128.0.0.1'
      $o = has_interface_with('ipaddress', $a)
      notice(inline_template('has_interface_with is <%= @o.inspect %>'))
      EOS

      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(/has_interface_with is false/)
      end
    end
    it 'has_interface_with existing interface' do
      pp = <<-EOS
=======
require 'spec_helper_acceptance'

describe 'has_interface_with function', :unless => ((fact('osfamily') == 'windows') || (fact('osfamily') == 'AIX')) do
  describe 'success' do
    pp1 = <<-DOC
      $a = $::ipaddress
      $o = has_interface_with('ipaddress', $a)
      notice(inline_template('has_interface_with is <%= @o.inspect %>'))
    DOC
    it 'has_interface_with existing ipaddress' do
      apply_manifest(pp1, :catch_failures => true) do |r|
        expect(r.stdout).to match(%r{has_interface_with is true})
      end
    end

    pp2 = <<-DOC
      $a = '128.0.0.1'
      $o = has_interface_with('ipaddress', $a)
      notice(inline_template('has_interface_with is <%= @o.inspect %>'))
    DOC
    it 'has_interface_with absent ipaddress' do
      apply_manifest(pp2, :catch_failures => true) do |r|
        expect(r.stdout).to match(%r{has_interface_with is false})
      end
    end

    pp3 = <<-DOC
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
      if $osfamily == 'Solaris' or $osfamily == 'Darwin' {
        $a = 'lo0'
      }elsif $osfamily == 'windows' {
        $a = $::kernelmajversion ? {
          /6\.(2|3|4)/ => 'Ethernet0',
          /6\.(0|1)/ => 'Local_Area_Connection',
          /5\.(1|2)/  => undef, #Broken current in facter
        }
      }else {
        $a = 'lo'
      }
      $o = has_interface_with($a)
      notice(inline_template('has_interface_with is <%= @o.inspect %>'))
<<<<<<< HEAD
      EOS

      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(/has_interface_with is true/)
=======
    DOC
    it 'has_interface_with existing interface' do
      apply_manifest(pp3, :catch_failures => true) do |r|
        expect(r.stdout).to match(%r{has_interface_with is true})
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
      end
    end
  end
  describe 'failure' do
    it 'handles no arguments'
    it 'handles non strings'
  end
end
