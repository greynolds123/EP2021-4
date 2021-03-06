require 'spec_helper'

describe 'delete_undef_values' do
  let(:is_puppet_6) { Puppet::Util::Package.versioncmp(Puppet.version, '6.0.0') == 0 }

  it { is_expected.not_to eq(nil) }
<<<<<<< HEAD
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{Wrong number of arguments}) }
  it { is_expected.to run.with_params(1).and_raise_error(Puppet::ParseError, %r{expected an array or hash}) }
  it { is_expected.to run.with_params('one').and_raise_error(Puppet::ParseError, %r{expected an array or hash}) }
  it { is_expected.to run.with_params('one', 'two').and_raise_error(Puppet::ParseError, %r{expected an array or hash}) }

  describe 'when deleting from an array' do
    # Behavior is different in Puppet 6.0.0, and fixed in PUP-9180 in Puppet 6.0.1
=======
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params(1).and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one', 'two').and_raise_error(Puppet::ParseError) }

  describe 'when deleting from an array' do
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    [:undef, '', nil].each do |undef_value|
      describe "when undef is represented by #{undef_value.inspect}" do
        before(:each) do
          pending("review behaviour when being passed undef as #{undef_value.inspect}") if undef_value == ''
<<<<<<< HEAD
          pending("review behaviour when being passed undef as #{undef_value.inspect}") if undef_value == :undef && is_puppet_6
        end
        it { is_expected.to run.with_params([undef_value]).and_return([]) }
        it { is_expected.to run.with_params(['one', undef_value, 'two', 'three']).and_return(['one', 'two', 'three']) }
        it { is_expected.to run.with_params(['ớņέ', undef_value, 'ŧשּׁō', 'ŧħґëə']).and_return(['ớņέ', 'ŧשּׁō', 'ŧħґëə']) }
=======
          pending("review behaviour when being passed undef as #{undef_value.inspect}") if undef_value.nil?
        end
        it { is_expected.to run.with_params([undef_value]).and_return([]) }
        it { is_expected.to run.with_params(['one', undef_value, 'two', 'three']).and_return(%w[one two three]) }
        it { is_expected.to run.with_params(['ớņέ', undef_value, 'ŧשּׁō', 'ŧħґëə']).and_return(%w[ớņέ ŧשּׁō ŧħґëə]) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      end

      it 'leaves the original argument intact' do
        argument = ['one', undef_value, 'two']
        original = argument.dup
<<<<<<< HEAD
        _result = subject.execute(argument, 2)
=======
        _result = subject.call([argument, 2])
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        expect(argument).to eq(original)
      end
    end

    it { is_expected.to run.with_params(['undef']).and_return(['undef']) }
  end

  describe 'when deleting from a hash' do
    [:undef, '', nil].each do |undef_value|
      describe "when undef is represented by #{undef_value.inspect}" do
        before(:each) do
          pending("review behaviour when being passed undef as #{undef_value.inspect}") if undef_value == ''
<<<<<<< HEAD
          pending("review behaviour when being passed undef as #{undef_value.inspect}") if undef_value == :undef && is_puppet_6
=======
          pending("review behaviour when being passed undef as #{undef_value.inspect}") if undef_value.nil?
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        end
        it { is_expected.to run.with_params('key' => undef_value).and_return({}) }
        it {
          is_expected.to run \
            .with_params('key1' => 'value1', 'undef_key' => undef_value, 'key2' => 'value2') \
            .and_return('key1' => 'value1', 'key2' => 'value2')
        }
      end

      it 'leaves the original argument intact' do
        argument = { 'key1' => 'value1', 'key2' => undef_value }
        original = argument.dup
<<<<<<< HEAD
        _result = subject.execute(argument, 2)
=======
        _result = subject.call([argument, 2])
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        expect(argument).to eq(original)
      end
    end

    it { is_expected.to run.with_params('key' => 'undef').and_return('key' => 'undef') }
  end
end
