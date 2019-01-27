require 'spec_helper'

describe 'is_array' do
<<<<<<< HEAD
  
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params().and_raise_error(Puppet::ParseError, /wrong number of arguments/i) }
  it {
    pending("Current implementation ignores parameters after the first.")
    is_expected.to run.with_params([], []).and_raise_error(Puppet::ParseError, /wrong number of arguments/i)
=======
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it {
    pending('Current implementation ignores parameters after the first.')
    is_expected.to run.with_params([], []).and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i)
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
  }
  it { is_expected.to run.with_params([]).and_return(true) }
  it { is_expected.to run.with_params(['one']).and_return(true) }
  it { is_expected.to run.with_params([1]).and_return(true) }
  it { is_expected.to run.with_params([{}]).and_return(true) }
  it { is_expected.to run.with_params([[]]).and_return(true) }
  it { is_expected.to run.with_params('').and_return(false) }
  it { is_expected.to run.with_params('one').and_return(false) }
  it { is_expected.to run.with_params(1).and_return(false) }
  it { is_expected.to run.with_params({}).and_return(false) }
<<<<<<< HEAD
  context 'Checking for deprecation warning' do
    after(:all) do
      ENV.delete('STDLIB_LOG_DEPRECATIONS')
    end 
    # Checking for deprecation warning, which should only be provoked when the env variable for it is set.
    it 'should display a single deprecation' do
      ENV['STDLIB_LOG_DEPRECATIONS'] = "true"
      scope.expects(:warning).with(includes('This method is deprecated'))
      is_expected.to run.with_params(['1.2.3.4']).and_return(true)
    end
    it 'should display no warning for deprecation' do
      ENV['STDLIB_LOG_DEPRECATIONS'] = "false"
=======
  context 'with deprecation warning' do
    after(:each) do
      ENV.delete('STDLIB_LOG_DEPRECATIONS')
    end
    # Checking for deprecation warning, which should only be provoked when the env variable for it is set.
    it 'displays a single deprecation' do
      ENV['STDLIB_LOG_DEPRECATIONS'] = 'true'
      scope.expects(:warning).with(includes('This method is deprecated'))
      is_expected.to run.with_params(['1.2.3.4']).and_return(true)
    end
    it 'displays no warning for deprecation' do
      ENV['STDLIB_LOG_DEPRECATIONS'] = 'false'
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
      scope.expects(:warning).with(includes('This method is deprecated')).never
      is_expected.to run.with_params(['1.2.3.4']).and_return(true)
    end
  end
end
