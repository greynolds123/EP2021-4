require 'spec_helper'

describe 'is_float' do
  it { is_expected.not_to eq(nil) }

  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it { is_expected.to run.with_params(0.1, 0.2).and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
<<<<<<< HEAD
  it { is_expected.to run.with_params('0.1').and_return(true) }
  it { is_expected.to run.with_params('1.0').and_return(true) }
  it { is_expected.to run.with_params('1').and_return(false) }
  it { is_expected.to run.with_params('one').and_return(false) }
  it { is_expected.to run.with_params('one 1.0').and_return(false) }
  it { is_expected.to run.with_params('1.0 one').and_return(false) }
  it { is_expected.to run.with_params(0.1).and_return(true) }
  it { is_expected.to run.with_params(1.0).and_return(true) }
  it { is_expected.to run.with_params(1).and_return(false) }
  it { is_expected.to run.with_params({}).and_return(false) }
  it { is_expected.to run.with_params([]).and_return(false) }
=======

  describe 'passing a string' do
    it { is_expected.to run.with_params('0.1').and_return(true) }
    it { is_expected.to run.with_params('1.0').and_return(true) }
    it { is_expected.to run.with_params('1').and_return(false) }
    it { is_expected.to run.with_params('one').and_return(false) }
    it { is_expected.to run.with_params('one 1.0').and_return(false) }
    it { is_expected.to run.with_params('1.0 one').and_return(false) }
  end

  describe 'passing numbers' do
    it { is_expected.to run.with_params(0.1).and_return(true) }
    it { is_expected.to run.with_params(1.0).and_return(true) }
    it { is_expected.to run.with_params(1).and_return(false) }
  end
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

  context 'with deprecation warning' do
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
      is_expected.to run.with_params(2.2).and_return(true)
    end
    it 'displays no warning for deprecation' do
      ENV['STDLIB_LOG_DEPRECATIONS'] = 'false'
<<<<<<< HEAD
      expect(scope).to receive(:warning).with(include('This method is deprecated')).never
=======
      scope.expects(:warning).with(includes('This method is deprecated')).never
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      is_expected.to run.with_params(1.0).and_return(true)
    end
  end
end
