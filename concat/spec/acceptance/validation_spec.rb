require 'spec_helper_acceptance'

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
describe 'concat validate_cmd parameter', :unless => (fact('kernel') != 'Linux') do
  basedir = default.tmpdir('concat')
  context '=> "/usr/bin/test -e %"' do
    before(:all) do
      pp = <<-EOS
        file { '#{basedir}':
          ensure => directory
        }
      EOS
=======
describe 'validation, concat validate_cmd parameter', if: ['debian', 'redhat', 'ubuntu'].include?(os[:family]) do
  before(:all) do
    @basedir = setup_test_directory
  end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed

  context 'with "/usr/bin/test -e %"' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
        validate_cmd => '/usr/bin/test -e %',
      }
      concat::fragment { 'content':
        target  => '#{@basedir}/file',
        content => 'content',
      }
      MANIFEST
    end

<<<<<<< HEAD
    describe file("#{basedir}/file") do
      it { should be_file }
      it { should contain 'content' }
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
describe 'validation, concat validate_cmd parameter', if: ['debian', 'redhat', 'ubuntu'].include?(os[:family]) do
  before(:all) do
    @basedir = setup_test_directory
  end

  context 'with "/usr/bin/test -e %"' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
        validate_cmd => '/usr/bin/test -e %',
      }
      concat::fragment { 'content':
        target  => '#{@basedir}/file',
        content => 'content',
      }
      MANIFEST
    end

=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file").content).to contain 'content'
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end
end
