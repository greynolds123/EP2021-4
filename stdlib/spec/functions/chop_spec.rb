require 'spec_helper'

describe 'chop', :if => Puppet::Util::Package.versioncmp(Puppet.version, '6.0.0') < 0 do
  it { is_expected.not_to eq(nil) }
<<<<<<< HEAD
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{Wrong number of arguments}) }
  it { is_expected.to run.with_params(1).and_raise_error(Puppet::ParseError, %r{Requires either an array or string}) }
=======
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params(1).and_raise_error(Puppet::ParseError) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  it {
    pending('Current implementation ignores parameters after the first.')
    is_expected.to run.with_params('a', 'b').and_raise_error(Puppet::ParseError)
  }
  it { is_expected.to run.with_params('one').and_return('on') }
  it { is_expected.to run.with_params("one\n").and_return('one') }
  it { is_expected.to run.with_params("one\n\n").and_return("one\n") }
<<<<<<< HEAD
  it { is_expected.to run.with_params(["one\n", 'two', "three\n"]).and_return(['one', 'tw', 'three']) }
=======
  it { is_expected.to run.with_params(%W[one\n two three\n]).and_return(%w[one tw three]) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

  it { is_expected.to run.with_params(AlsoString.new('one')).and_return('on') }
  it { is_expected.to run.with_params(AlsoString.new("one\n")).and_return('one') }
  it { is_expected.to run.with_params(AlsoString.new("one\n\n")).and_return("one\n") }
<<<<<<< HEAD
  it { is_expected.to run.with_params([AlsoString.new("one\n"), AlsoString.new('two'), "three\n"]).and_return(['one', 'tw', 'three']) }

  it { is_expected.to run.with_params([1, 2, 3]).and_return([1, 2, 3]) }
=======
  it { is_expected.to run.with_params([AlsoString.new("one\n"), AlsoString.new('two'), "three\n"]).and_return(%w[one tw three]) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

  context 'with UTF8 and double byte characters' do
    it { is_expected.to run.with_params("ůťƒ8\n\n").and_return("ůťƒ8\n") }
    it { is_expected.to run.with_params("ネット\n\n").and_return("ネット\n") }
  end
end
