require 'spec_helper_acceptance'

describe 'anchor type' do
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
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    DOC
    it 'effects proper chaining of resources' do
      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stdout).to match(%r{Anchor\[final\]: Triggered 'refresh'})
      end
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
    end
  end
end
