require 'spec_helper_acceptance'

describe 'warnings' do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  basedir = default.tmpdir('concat')

  shared_examples 'has_warning' do |pp, w|
    it 'applies the manifest twice with a stderr regex' do
      expect(apply_manifest(pp, :catch_failures => true).stderr).to match(/#{Regexp.escape(w)}/m)
      expect(apply_manifest(pp, :catch_changes => true).stderr).to match(/#{Regexp.escape(w)}/m)
    end
  end

  context 'concat force parameter deprecation' do
    pp = <<-EOS
      concat { '#{basedir}/file':
        force => false,
      }
      concat::fragment { 'foo':
        target  => '#{basedir}/file',
        content => 'bar',
      }
    EOS
    w = 'The $force parameter to concat is deprecated and has no effect.'

    it_behaves_like 'has_warning', pp, w
=======
  before(:all) do
    @basedir = setup_test_directory
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
  before(:all) do
    @basedir = setup_test_directory
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  end

  context 'when concat::fragment target not found' do
    let(:pp) do
      <<-MANIFEST
      concat { 'file':
        path => '#{@basedir}/file',
      }
      concat::fragment { 'foo':
        target  => '#{@basedir}/bar',
        content => 'bar',
      }
    MANIFEST
    end

<<<<<<< HEAD
<<<<<<< HEAD
    it_behaves_like 'has_warning', pp, w
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  before(:all) do
    @basedir = setup_test_directory
  end

  context 'when concat::fragment target not found' do
    let(:pp) do
      <<-MANIFEST
      concat { 'file':
        path => '#{@basedir}/file',
      }
      concat::fragment { 'foo':
        target  => '#{@basedir}/bar',
        content => 'bar',
      }
    MANIFEST
    end

    it 'applies manifests, check stderr' do
      expect(apply_manifest(pp, expect_failures: true).stderr).to match 'not found in the catalog'
      expect(apply_manifest(pp, expect_failures: true).stderr).to match 'not found in the catalog'
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
    it 'applies manifests, check stderr' do
      expect(apply_manifest(pp, expect_failures: true).stderr).to match 'not found in the catalog'
      expect(apply_manifest(pp, expect_failures: true).stderr).to match 'not found in the catalog'
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    it 'applies manifests, check stderr' do
      expect(apply_manifest(pp, expect_failures: true).stderr).to match 'not found in the catalog'
      expect(apply_manifest(pp, expect_failures: true).stderr).to match 'not found in the catalog'
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    end
  end
end
