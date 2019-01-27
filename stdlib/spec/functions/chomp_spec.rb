require 'spec_helper'

describe 'chomp' do
  it { is_expected.not_to eq(nil) }
<<<<<<< HEAD
  it { is_expected.to run.with_params().and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params(1).and_raise_error(Puppet::ParseError) }
  it {
    pending("Current implementation ignores parameters after the first.")
    is_expected.to run.with_params("a", "b").and_raise_error(Puppet::ParseError)
  }
  it { is_expected.to run.with_params("one").and_return("one") }
  it { is_expected.to run.with_params("one\n").and_return("one") }
  it { is_expected.to run.with_params("one\n\n").and_return("one\n") }
  it { is_expected.to run.with_params(["one\n", "two", "three\n"]).and_return(["one", "two", "three"]) }

  it { is_expected.to run.with_params(AlsoString.new("one")).and_return("one") }
  it { is_expected.to run.with_params(AlsoString.new("one\n")).and_return("one") }
  it { is_expected.to run.with_params(AlsoString.new("one\n\n")).and_return("one\n") }
  it { is_expected.to run.with_params([AlsoString.new("one\n"), AlsoString.new("two"), "three\n"]).and_return(["one", "two", "three"]) }
=======
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params(1).and_raise_error(Puppet::ParseError) }
  it {
    pending('Current implementation ignores parameters after the first.')
    is_expected.to run.with_params('a', 'b').and_raise_error(Puppet::ParseError)
  }
  it { is_expected.to run.with_params('one').and_return('one') }
  it { is_expected.to run.with_params("one\n").and_return('one') }
  it { is_expected.to run.with_params("one\n\n").and_return("one\n") }
  it { is_expected.to run.with_params(%W[one\n two three\n]).and_return(%w[one two three]) }

  it { is_expected.to run.with_params(AlsoString.new('one')).and_return('one') }
  it { is_expected.to run.with_params(AlsoString.new("one\n")).and_return('one') }
  it { is_expected.to run.with_params(AlsoString.new("one\n\n")).and_return("one\n") }
  it { is_expected.to run.with_params([AlsoString.new("one\n"), AlsoString.new('two'), "three\n"]).and_return(%w[one two three]) }

  context 'with UTF8 and double byte characters' do
    it { is_expected.to run.with_params("ůťƒ8\n\n").and_return("ůťƒ8\n") }
    it { is_expected.to run.with_params("ネット\n\n").and_return("ネット\n") }
  end
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
end
