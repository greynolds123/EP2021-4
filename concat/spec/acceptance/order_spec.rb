require 'spec_helper_acceptance'

describe 'concat order' do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  basedir = default.tmpdir('concat')

  context '=> ' do
    shared_examples 'sortby' do |order_by, match_output|
      pp = <<-EOS
      concat { '#{basedir}/foo':
        order => '#{order_by}'
      }
      concat::fragment { '1':
        target  => '#{basedir}/foo',
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  before(:all) do
    @basedir = setup_test_directory
  end
  describe 'sortby alpha' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/foo':
        order => 'alpha'
      }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  before(:all) do
    @basedir = setup_test_directory
  end
  describe 'sortby alpha' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/foo':
        order => 'alpha'
      }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
        content => 'string1',
        order   => '1',
      }
      concat::fragment { '2':
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        target  => '#{basedir}/foo',
=======
        target  => '#{@basedir}/foo',
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
        target  => '#{@basedir}/foo',
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
        target  => '#{@basedir}/foo',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
        target  => '#{@basedir}/foo',
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
        content => 'string2',
        order   => '2',
      }
      concat::fragment { '10':
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        target  => '#{basedir}/foo',
=======
        target  => '#{@basedir}/foo',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
        target  => '#{@basedir}/foo',
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
        content => 'string10',
      }
      MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/foo")).to be_file
      expect(file("#{@basedir}/foo").content).to match %r{string1string10string2}
    end
  end

  describe 'sortby numeric' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/foo':
        order => 'numeric'
      }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        content => 'string1',
        order   => '1',
      }
      concat::fragment { '2':
        target  => '#{@basedir}/foo',
        content => 'string2',
        order   => '2',
      }
      concat::fragment { '10':
        target  => '#{@basedir}/foo',
        content => 'string10',
      }
      MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/foo")).to be_file
<<<<<<< HEAD
<<<<<<< HEAD
      expect(file("#{@basedir}/foo").content).to match %r{string1string2string10}
    end
  end
<<<<<<< HEAD
<<<<<<< HEAD
end # concat::fragment order
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
        target  => '#{@basedir}/foo',
        content => 'string10',
      }
      MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/foo")).to be_file
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      expect(file("#{@basedir}/foo").content).to match %r{string1string10string2}
    end
  end

  describe 'sortby numeric' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/foo':
        order => 'numeric'
      }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'string1',
        order   => '1',
      }
      concat::fragment { '2':
        target  => '#{@basedir}/foo',
        content => 'string2',
        order   => '2',
      }
      concat::fragment { '10':
        target  => '#{@basedir}/foo',
        content => 'string10',
      }
      MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/foo")).to be_file
      expect(file("#{@basedir}/foo").content).to match %r{string1string2string10}
    end
  end
end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
end
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
