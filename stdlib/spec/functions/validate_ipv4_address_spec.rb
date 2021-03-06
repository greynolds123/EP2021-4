require 'spec_helper'

describe 'validate_ipv4_address' do
  describe 'signature validation' do
    it { is_expected.not_to eq(nil) }
    it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  end

  context 'Checking for deprecation warning', :if => Puppet.version.to_f < 4.0 do
    after(:each) do
      ENV.delete('STDLIB_LOG_DEPRECATIONS')
    end
    # Checking for deprecation warning, which should only be provoked when the env variable for it is set.
    it 'displays a single deprecation' do
      ENV['STDLIB_LOG_DEPRECATIONS'] = 'true'
<<<<<<< HEAD
      expect(scope).to receive(:warning).with(include('This method is deprecated'))
=======
      scope.expects(:warning).with(includes('This method is deprecated'))
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      is_expected.to run.with_params(SharedData::IPV4_PATTERNS.first)
    end
    it 'displays no warning for deprecation' do
      ENV['STDLIB_LOG_DEPRECATIONS'] = 'false'
<<<<<<< HEAD
      expect(scope).to receive(:warning).with(include('This method is deprecated')).never
=======
      scope.expects(:warning).with(includes('This method is deprecated')).never
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      is_expected.to run.with_params(SharedData::IPV4_PATTERNS.first)
    end
  end

  SharedData::IPV4_PATTERNS.each do |value|
    it { is_expected.to run.with_params(value) }
  end

  SharedData::IPV4_NEGATIVE_PATTERNS.each do |value|
    it { is_expected.to run.with_params(value).and_raise_error(Puppet::ParseError, %r{is not a valid IPv4}) }
  end

  describe 'invalid inputs' do
    [{}, [], 1, true].each do |invalid|
      it { is_expected.to run.with_params(invalid).and_raise_error(Puppet::ParseError, %r{is not a string}) }
      it { is_expected.to run.with_params(SharedData::IPV4_PATTERNS.first, invalid).and_raise_error(Puppet::ParseError, %r{is not a string}) }
    end
<<<<<<< HEAD
  end

  describe 'multiple inputs' do
    it { is_expected.to run.with_params(SharedData::IPV4_PATTERNS[0], SharedData::IPV4_PATTERNS[1]) }
    it { is_expected.to run.with_params(SharedData::IPV4_PATTERNS[0], 'invalid ip').and_raise_error(Puppet::ParseError, %r{is not a valid IPv4}) }
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  end
end
