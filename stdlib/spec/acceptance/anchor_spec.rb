require 'spec_helper_acceptance'

describe 'anchor type' do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  describe 'success' do
    pp = <<-DOC
=======
  let(:pp) do
    <<-MANIFEST
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
  describe 'success' do
    pp = <<-DOC
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
  describe 'success' do
    pp = <<-DOC
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
  describe 'success' do
    pp = <<-DOC
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
  describe 'success' do
    pp = <<-DOC
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      class anchored {
        anchor { 'anchored::begin': }
        ~> anchor { 'anchored::end': }
      }

      class anchorrefresh {
        notify { 'first': }
        ~> class { 'anchored': }
        ~> anchor { 'final': }
      }

      include anchorrefresh
<<<<<<< HEAD
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
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
    it 'effects proper chaining of resources' do
      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(%r{Anchor\[final\]: Triggered 'refresh'})
      end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    MANIFEST
  end

  it 'applies manifest, anchors resources in correct order' do
    apply_manifest(pp) do |r|
      expect(r.stdout).to match(%r{Anchor\[final\]: Triggered 'refresh'})
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    end
  end
end
