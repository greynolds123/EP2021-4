require 'spec_helper_acceptance'

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
describe 'concat warn =>' do
  basedir = default.tmpdir('concat')
  context 'true should enable default warning message' do
    pp = <<-EOS
      concat { '#{basedir}/file':
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
describe 'concat warn_header =>' do
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'applies the manifest twice with no stderr' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
        warn  => true,
      }

      concat::fragment { '1':
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        target  => '#{basedir}/file',
=======
        target  => '#{@basedir}/file',
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
        target  => '#{@basedir}/file',
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
        target  => '#{@basedir}/file',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
        target  => '#{@basedir}/file',
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
        target  => '#{@basedir}/file',
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
        content => '1',
        order   => '01',
      }

      concat::fragment { '2':
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        target  => '#{basedir}/file',
=======
        target  => '#{@basedir}/file',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        content => '2',
        order   => '02',
      }

      concat { '#{@basedir}/file2':
        warn  => false,
      }

<<<<<<< HEAD
      concat::fragment { '1':
        target  => '#{basedir}/file',
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
        target  => '#{@basedir}/file',
        content => '2',
        order   => '02',
      }

      concat { '#{@basedir}/file2':
        warn  => false,
      }

      concat::fragment { 'file2_1':
        target  => '#{@basedir}/file2',
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
      concat::fragment { 'file2_1':
        target  => '#{@basedir}/file2',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
        content => '1',
        order   => '01',
      }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      concat::fragment { '2':
        target  => '#{basedir}/file',
=======
      concat::fragment { 'file2_2':
        target  => '#{@basedir}/file2',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
      concat::fragment { 'file2_2':
        target  => '#{@basedir}/file2',
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
        content => '2',
        order   => '02',
      }

      concat { '#{@basedir}/file3':
        warn  => "# foo\n",
      }

<<<<<<< HEAD
<<<<<<< HEAD
      concat::fragment { '1':
        target  => '#{basedir}/file',
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
      concat::fragment { 'file2_2':
        target  => '#{@basedir}/file2',
        content => '2',
        order   => '02',
      }

      concat { '#{@basedir}/file3':
        warn  => "# foo\n",
      }

      concat::fragment { 'file3_1':
        target  => '#{@basedir}/file3',
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
      concat::fragment { 'file3_1':
        target  => '#{@basedir}/file3',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
      concat::fragment { 'file3_1':
        target  => '#{@basedir}/file3',
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
        content => '1',
        order   => '01',
      }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      concat::fragment { '2':
        target  => '#{basedir}/file',
=======
      concat::fragment { 'file3_2':
        target  => '#{@basedir}/file3',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        content => '2',
        order   => '02',
      }

    MANIFEST
    end

<<<<<<< HEAD
    describe file("#{basedir}/file") do
      it { should be_file }
      its(:content) {
        should match /# foo/
        should match /1/
        should match /2/
      }
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
      concat::fragment { 'file3_2':
        target  => '#{@basedir}/file3',
        content => '2',
        order   => '02',
      }

    MANIFEST
    end

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    it 'when true should enable default warning message' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file").content).to match %r{# This file is managed by Puppet\. DO NOT EDIT\.}
      expect(file("#{@basedir}/file").content).to match %r{1}
      expect(file("#{@basedir}/file").content).to match %r{2}
    end

    it 'when false should not enable default warning message' do
      expect(file("#{@basedir}/file2")).to be_file
      expect(file("#{@basedir}/file2").content).not_to match %r{# This file is managed by Puppet\. DO NOT EDIT\.}
      expect(file("#{@basedir}/file2").content).to match %r{1}
      expect(file("#{@basedir}/file2").content).to match %r{2}
    end

    it 'when foo should overide default warning message' do
      expect(file("#{@basedir}/file3")).to be_file
      expect(file("#{@basedir}/file3").content).to match %r{# foo}
      expect(file("#{@basedir}/file3").content).to match %r{1}
      expect(file("#{@basedir}/file3").content).to match %r{2}
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    end
  end
end
