<<<<<<< HEAD
#! /usr/bin/env ruby -S rspec
require 'spec_helper_acceptance'

describe 'floor function', :unless => UNSUPPORTED_PLATFORMS.include?(fact('operatingsystem')) do
  describe 'success' do
    it 'floors floats' do
      pp = <<-EOS
=======
require 'spec_helper_acceptance'

describe 'floor function' do
  describe 'success' do
    pp1 = <<-DOC
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
      $a = 12.8
      $b = 12
      $o = floor($a)
      if $o == $b {
        notify { 'output correct': }
      }
<<<<<<< HEAD
      EOS

      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(/Notice: output correct/)
      end
    end
    it 'floors integers' do
      pp = <<-EOS
=======
    DOC
    it 'floors floats' do
      apply_manifest(pp1, :catch_failures => true) do |r|
        expect(r.stdout).to match(%r{Notice: output correct})
      end
    end

    pp2 = <<-DOC
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
      $a = 7
      $b = 7
      $o = floor($a)
      if $o == $b {
        notify { 'output correct': }
      }
<<<<<<< HEAD
      EOS

      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(/Notice: output correct/)
=======
    DOC
    it 'floors integers' do
      apply_manifest(pp2, :catch_failures => true) do |r|
        expect(r.stdout).to match(%r{Notice: output correct})
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
      end
    end
  end
  describe 'failure' do
    it 'handles improper argument counts'
    it 'handles non-numbers'
  end
end
