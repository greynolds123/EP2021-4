require 'spec_helper'

describe 'validate_bool' do
  after(:each) do
    ENV.delete('STDLIB_LOG_DEPRECATIONS')
  end

  # Checking for deprecation warning
  it 'displays a single deprecation' do
    ENV['STDLIB_LOG_DEPRECATIONS'] = 'true'
<<<<<<< HEAD
    expect(scope).to receive(:warning).with(include('This method is deprecated'))
=======
    scope.expects(:warning).with(includes('This method is deprecated'))
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    is_expected.to run.with_params(true)
  end

  describe 'signature validation' do
    it { is_expected.not_to eq(nil) }
    it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  end

  describe 'acceptable values' do
    it { is_expected.to run.with_params(true) }
    it { is_expected.to run.with_params(false) }
    it { is_expected.to run.with_params(true, false, false, true) }
  end

  describe 'validation failures' do
<<<<<<< HEAD
    it { is_expected.to run.with_params([]).and_raise_error(Puppet::ParseError, %r{is not a boolean}) }
    it { is_expected.to run.with_params({}).and_raise_error(Puppet::ParseError, %r{is not a boolean}) }
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    it { is_expected.to run.with_params('one').and_raise_error(Puppet::ParseError, %r{is not a boolean}) }
    it { is_expected.to run.with_params(true, 'one').and_raise_error(Puppet::ParseError, %r{is not a boolean}) }
    it { is_expected.to run.with_params('one', false).and_raise_error(Puppet::ParseError, %r{is not a boolean}) }
    it { is_expected.to run.with_params('true').and_raise_error(Puppet::ParseError, %r{is not a boolean}) }
    it { is_expected.to run.with_params('false').and_raise_error(Puppet::ParseError, %r{is not a boolean}) }
    it { is_expected.to run.with_params(true, 'false').and_raise_error(Puppet::ParseError, %r{is not a boolean}) }
    it { is_expected.to run.with_params('true', false).and_raise_error(Puppet::ParseError, %r{is not a boolean}) }
    it { is_expected.to run.with_params('true', false, false, false, false, false).and_raise_error(Puppet::ParseError, %r{is not a boolean}) }
  end
end
