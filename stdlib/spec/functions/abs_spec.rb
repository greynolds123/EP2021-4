require 'spec_helper'
<<<<<<< HEAD
if Puppet::Util::Package.versioncmp(Puppet.version, '6.0.0') < 0
  describe 'abs' do
    it { is_expected.not_to eq(nil) }
    it { is_expected.to run.with_params(-34).and_return(34) }
    it { is_expected.to run.with_params('-34').and_return(34) }
    it { is_expected.to run.with_params(34).and_return(34) }
    it { is_expected.to run.with_params('34').and_return(34) }
    it { is_expected.to run.with_params(-34.5).and_return(34.5) }
    it { is_expected.to run.with_params('-34.5').and_return(34.5) }
    it { is_expected.to run.with_params(34.5).and_return(34.5) }
    it { is_expected.to run.with_params('34.5').and_return(34.5) }
  end
=======

describe 'abs' do
  it { is_expected.not_to eq(nil) }

  describe 'signature validation in puppet3', :unless => RSpec.configuration.puppet_future do
    it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
    it {
      pending('Current implementation ignores parameters after the first.')
      is_expected.to run.with_params(1, 2).and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i)
    }
  end

  describe 'signature validation in puppet4', :if => RSpec.configuration.puppet_future do
    it {
      pending 'the puppet 4 implementation'
      is_expected.to run.with_params.and_raise_error(ArgumentError)
    }
    it {
      pending 'the puppet 4 implementation'
      is_expected.to run.with_params(1, 2).and_raise_error(ArgumentError)
    }
    it {
      pending 'the puppet 4 implementation'
      is_expected.to run.with_params([]).and_raise_error(ArgumentError)
    }
    it {
      pending 'the puppet 4 implementation'
      is_expected.to run.with_params({}).and_raise_error(ArgumentError)
    }
    it {
      pending 'the puppet 4 implementation'
      is_expected.to run.with_params(true).and_raise_error(ArgumentError)
    }
  end

  it { is_expected.to run.with_params(-34).and_return(34) }
  it { is_expected.to run.with_params('-34').and_return(34) }
  it { is_expected.to run.with_params(34).and_return(34) }
  it { is_expected.to run.with_params('34').and_return(34) }
  it { is_expected.to run.with_params(-34.5).and_return(34.5) }
  it { is_expected.to run.with_params('-34.5').and_return(34.5) }
  it { is_expected.to run.with_params(34.5).and_return(34.5) }
  it { is_expected.to run.with_params('34.5').and_return(34.5) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
end
