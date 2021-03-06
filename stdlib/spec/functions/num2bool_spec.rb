require 'spec_helper'

describe 'num2bool' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it { is_expected.to run.with_params(1, 2).and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it { is_expected.to run.with_params('abc').and_raise_error(Puppet::ParseError, %r{does not look like a number}) }
  it { is_expected.to run.with_params(1).and_return(true) }
  it { is_expected.to run.with_params('1').and_return(true) }
  it { is_expected.to run.with_params(1.5).and_return(true) }
  it { is_expected.to run.with_params('1.5').and_return(true) }
  it { is_expected.to run.with_params(-1).and_return(false) }
  it { is_expected.to run.with_params('-1').and_return(false) }
  it { is_expected.to run.with_params(-1.5).and_return(false) }
  it { is_expected.to run.with_params('-1.5').and_return(false) }
  it { is_expected.to run.with_params(0).and_return(false) }
  it { is_expected.to run.with_params('0').and_return(false) }
  it { is_expected.to run.with_params([]).and_return(false) }
  it { is_expected.to run.with_params('[]').and_raise_error(Puppet::ParseError, %r{does not look like a number}) }
  it { is_expected.to run.with_params({}).and_return(false) }
  it { is_expected.to run.with_params('{}').and_raise_error(Puppet::ParseError, %r{does not look like a number}) }
<<<<<<< HEAD
  it { is_expected.to run.with_params(['-50', '1']).and_return(false) }
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
end
