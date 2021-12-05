require 'spec_helper'

describe 'validate_array' do
  describe 'signature validation' do
    after(:each) do
      ENV.delete('STDLIB_LOG_DEPRECATIONS')
    end
    it { is_expected.not_to eq(nil) }
    # Checking for deprecation warning
    it 'displays a single deprecation' do
      ENV['STDLIB_LOG_DEPRECATIONS'] = 'true'
<<<<<<< HEAD
      expect(scope).to receive(:warning).with(include('This method is deprecated'))
=======
      scope.expects(:warning).with(includes('This method is deprecated'))
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      is_expected.to run.with_params([])
    end
    it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }

    describe 'valid inputs' do
      it { is_expected.to run.with_params([]) }
      it { is_expected.to run.with_params(['one']) }
      it { is_expected.to run.with_params([], ['two']) }
      it { is_expected.to run.with_params(['one'], ['two']) }
    end

    describe 'invalid inputs' do
      it { is_expected.to run.with_params({}).and_raise_error(Puppet::ParseError, %r{is not an Array}) }
      it { is_expected.to run.with_params(1).and_raise_error(Puppet::ParseError, %r{is not an Array}) }
      it { is_expected.to run.with_params(true).and_raise_error(Puppet::ParseError, %r{is not an Array}) }
      it { is_expected.to run.with_params('one').and_raise_error(Puppet::ParseError, %r{is not an Array}) }
      it { is_expected.to run.with_params([], {}).and_raise_error(Puppet::ParseError, %r{is not an Array}) }
      it { is_expected.to run.with_params([], 1).and_raise_error(Puppet::ParseError, %r{is not an Array}) }
      it { is_expected.to run.with_params([], true).and_raise_error(Puppet::ParseError, %r{is not an Array}) }
      it { is_expected.to run.with_params([], 'one').and_raise_error(Puppet::ParseError, %r{is not an Array}) }
<<<<<<< HEAD
      it { is_expected.to run.with_params(nil).and_raise_error(Puppet::ParseError, %r{is not an Array}) }
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    end
  end
end
