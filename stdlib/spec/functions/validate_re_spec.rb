require 'spec_helper'

describe 'validate_re' do
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
    is_expected.to run.with_params('', '')
  end

  describe 'signature validation' do
    it { is_expected.not_to eq(nil) }
    it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
    it { is_expected.to run.with_params('').and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
    it { is_expected.to run.with_params('', '', '', 'extra').and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }

    describe 'valid inputs' do
      it { is_expected.to run.with_params('', '') }
      it { is_expected.to run.with_params('', ['']) }
      it { is_expected.to run.with_params('', [''], 'custom error') }
      it { is_expected.to run.with_params('one', '^one') }
      it { is_expected.to run.with_params('one', ['^one', '^two']) }
      it { is_expected.to run.with_params('one', ['^one', '^two'], 'custom error') }
    end

    describe 'invalid inputs' do
      it { is_expected.to run.with_params('', []).and_raise_error(Puppet::ParseError, %r{does not match}) }
      it { is_expected.to run.with_params('one', 'two').and_raise_error(Puppet::ParseError, %r{does not match}) }
      it { is_expected.to run.with_params('', 'two').and_raise_error(Puppet::ParseError, %r{does not match}) }
      it { is_expected.to run.with_params('', ['two']).and_raise_error(Puppet::ParseError, %r{does not match}) }
      it { is_expected.to run.with_params('', ['two'], 'custom error').and_raise_error(Puppet::ParseError, %r{custom error}) }
      it { is_expected.to run.with_params('notone', '^one').and_raise_error(Puppet::ParseError, %r{does not match}) }
      it { is_expected.to run.with_params('notone', ['^one', '^two']).and_raise_error(Puppet::ParseError, %r{does not match}) }
      it { is_expected.to run.with_params('notone', ['^one', '^two'], 'custom error').and_raise_error(Puppet::ParseError, %r{custom error}) }
    end

    describe 'non-string inputs' do
      [
<<<<<<< HEAD
        1,                  # Fixnum
        3.14,               # Float
        nil,                # NilClass
        true,               # TrueClass
        false,              # FalseClass
        ['10'],             # Array
        :key,               # Symbol
        { :key => 'val' },  # Hash
=======
        1,             # Fixnum
        3.14,          # Float
        nil,           # NilClass
        true,          # TrueClass
        false,         # FalseClass
        ['10'],        # Array
        :key,          # Symbol
        { :key => 'val' }, # Hash
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      ].each do |input|
        it { is_expected.to run.with_params(input, '.*').and_raise_error(Puppet::ParseError, %r{needs to be a String}) }
      end
    end
  end
end
