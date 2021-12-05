require 'spec_helper'

describe 'floor', :if => Puppet::Util::Package.versioncmp(Puppet.version, '6.0.0') < 0 do
  it { is_expected.not_to eq(nil) }
<<<<<<< HEAD
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{Wrong number of arguments}) }
  it { is_expected.to run.with_params('foo').and_raise_error(Puppet::ParseError, %r{Wrong argument type}) }
  it { is_expected.to run.with_params([]).and_raise_error(Puppet::ParseError, %r{Wrong argument type}) }

=======
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('foo').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params([]).and_raise_error(Puppet::ParseError) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  it { is_expected.to run.with_params(34).and_return(34) }
  it { is_expected.to run.with_params(-34).and_return(-34) }
  it { is_expected.to run.with_params(33.1).and_return(33) }
  it { is_expected.to run.with_params(-33.1).and_return(-34) }
end
