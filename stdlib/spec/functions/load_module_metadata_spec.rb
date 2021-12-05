require 'spec_helper'

describe 'load_module_metadata' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it { is_expected.to run.with_params('one', 'two', 'three').and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }

  describe 'when calling with valid arguments' do
    before :each do
      allow(File).to receive(:read).with(%r{\/(stdlib|test)\/metadata.json}, :encoding => 'utf-8').and_return('{"name": "puppetlabs-stdlib"}')
      allow(File).to receive(:read).with(%r{\/(stdlib|test)\/metadata.json}).and_return('{"name": "puppetlabs-stdlib"}')
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
      # Additional modules used by litmus which are identified while running these dues to being in fixtures
      allow(File).to receive(:read).with(%r{\/(provision|puppet_agent|facts)\/metadata.json}, :encoding => 'utf-8')
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    end

    context 'when calling with valid utf8 and double byte character arguments' do
      before :each do
        allow(File).to receive(:read).with(%r{\/(stdlib|test)\/metadata.json}, :encoding => 'utf-8').and_return('{"ĭďèŉţĩƒіểя": "ċơņťęאּť ỡƒ ţħíš -
この文字"}')
        allow(File).to receive(:read).with(%r{\/(stdlib|test)\/metadata.json}).and_return('{"ĭďèŉţĩƒіểя": "ċơņťęאּť ỡƒ ţħíš -
この文字"}')
      end

      let(:prefix) { 'C:' if Puppet::Util::Platform.windows? }

      it 'jsons parse the file' do
        allow(scope).to receive(:function_get_module_path).with(['science']).and_return("#{prefix}/path/to/module/")
        allow(File).to receive(:exists?).with("#{prefix}/path/to/module/metadata.json").and_return(true)
        allow(File).to receive(:read).with("#{prefix}/path/to/module/metadata.json").and_return('{"name": "spencer-science"}')

<<<<<<< HEAD
        result = subject.execute('science')
=======
        result = subject.call(['science'])
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        expect(result['name']).to eq('spencer-science')
      end

      it 'fails by default if there is no metadata.json' do
        allow(scope).to receive(:function_get_module_path).with(['science']).and_return("#{prefix}/path/to/module/")
        allow(File).to receive(:exists?).with("#{prefix}/path/to/module/metadata.json").and_return(false)
        expect { subject.call(['science']) }.to raise_error(Puppet::ParseError)
      end

      it 'returns nil if user allows empty metadata.json' do
        allow(scope).to receive(:function_get_module_path).with(['science']).and_return("#{prefix}/path/to/module/")
        allow(File).to receive(:exists?).with("#{prefix}/path/to/module/metadata.json").and_return(false)
<<<<<<< HEAD
        result = subject.execute('science', true)
=======
        result = subject.call(['science', true])
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        expect(result).to eq({})
      end
    end
  end
end
