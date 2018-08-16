<<<<<<< HEAD
#! /usr/bin/env ruby -S rspec
require 'spec_helper_acceptance'

describe 'member function', :unless => UNSUPPORTED_PLATFORMS.include?(fact('operatingsystem')) do
  shared_examples 'item found' do
    it 'should output correctly' do
      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(/Notice: output correct/)
=======
require 'spec_helper_acceptance'

describe 'member function' do
  shared_examples 'item found' do
    it 'outputs correctly' do
      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(%r{Notice: output correct})
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
      end
    end
  end
  describe 'success' do
<<<<<<< HEAD
    it 'members arrays' do
      pp = <<-EOS
=======
    pp1 = <<-DOC
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
      $a = ['aaa','bbb','ccc']
      $b = 'ccc'
      $c = true
      $o = member($a,$b)
      if $o == $c {
        notify { 'output correct': }
      }
<<<<<<< HEAD
      EOS

      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(/Notice: output correct/)
      end
    end
    describe 'members array of integers' do
      it_should_behave_like 'item found' do
        let(:pp) { <<-EOS
      if member( [1,2,3,4], 4 ){
        notify { 'output correct': }
      }
        EOS
        }
      end
    end
    describe 'members of mixed array' do
      it_should_behave_like 'item found' do
        let(:pp) { <<-EOS
      if member( ['a','4',3], 'a' ){
        notify { 'output correct': }
}
        EOS
        }
=======
    DOC
    it 'members arrays' do
      apply_manifest(pp1, :catch_failures => true) do |r|
        expect(r.stdout).to match(%r{Notice: output correct})
      end
    end

    describe 'members array of integers' do
      let(:pp) do
        <<-DOC
            if member( [1,2,3,4], 4 ){
              notify { 'output correct': }
            }
        DOC
      end

      it_behaves_like 'item found' do
      end
    end
    describe 'members of mixed array' do
      let(:pp) do
        <<-DOC
            if member( ['a','4',3], 'a' ){
              notify { 'output correct': }
            }
        DOC
      end

      it_behaves_like 'item found' do
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
      end
    end
    it 'members arrays without members'
  end

  describe 'failure' do
    it 'handles improper argument counts'
  end
end
